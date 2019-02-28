#!/usr/bin/env python3

import argparse
import fnmatch
import multiprocessing
import os
from math import ceil

import tensorflow as tf
from pylab import figure, plt, savefig, subplot, figlegend, tight_layout

plt.rcParams.update({'figure.max_open_warning': 0})


def find_files_matching_pattern(pattern, path):
    result = []
    for root, dirs, files in os.walk(path, followlinks=True):
        for name in files:
            if fnmatch.fnmatch(name, pattern):
                result.append(os.path.join(root, name))
    return result


def read_events_file(events_filename):
    events = {}
    try:
        for event in tf.train.summary_iterator(events_filename):
            for value in event.summary.value:
                if value.tag not in events:
                    events[value.tag] = []
                events[value.tag].append((event.wall_time, value.simple_value))
    except Exception as e:
        print(f"While reading '{events_filename}':", e)
    return events


def read_all_events(log_dirs):
    events_by_log_dir = {}

    log_dir_event_file_tuples = []
    for log_dir in log_dirs:
        for event_file in find_files_matching_pattern('events.out.tfevents*', log_dir):
            log_dir_event_file_tuples.append((log_dir, event_file))

    pool = multiprocessing.Pool(processes=32)
    tuple_log_dirs, tuple_event_files = list(zip(*log_dir_event_file_tuples))
    events_in_each_file = pool.map(read_events_file, tuple_event_files)
    for log_dir, events in zip(tuple_log_dirs, events_in_each_file):
        if log_dir not in events_by_log_dir:
            events_by_log_dir[log_dir] = {}
        events_by_log_dir[log_dir].update(events)

    return events_by_log_dir


def smooth_values(values, smoothing):
    smoothed_values = []
    last = values[0]
    for v in values:
        smoothed_values.append(smoothing * last + (1 - smoothing) * v)
        last = smoothed_values[-1]
    return smoothed_values


def plot_values(ax, y_values, x_values, yname, xname, title_str, label, color, smoothing):
    smoothed_y_values = smooth_values(y_values, smoothing)
    ax.plot(x_values, y_values, alpha=0.2, color=color)
    line = ax.plot(x_values, smoothed_y_values, label=label, color=color)[0]
    ax.set_ylabel(yname)
    ax.set_xlabel(xname)
    ax.set_title(title_str)
    ax.grid(True)
    return line


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('log_dir', nargs='*')
    parser.add_argument('--n_cols', type=int, default=4)
    parser.add_argument('--smoothing', type=float, default=0.6)
    args = parser.parse_args()

    if not args.log_dir:
        raise Exception("Specify at least one log directory")
    for d in args.log_dir:
        if not os.path.exists(d):
            raise Exception(f"Directory {d} does not exist")

    print("Reading events...")
    events_by_log_dir = read_all_events(args.log_dir)

    i = len(os.path.commonprefix(args.log_dir))
    len_longest_suffix = len(os.path.commonprefix([s[::-1] for s in args.log_dir]))
    if len_longest_suffix > 0:
        j = -len_longest_suffix
    else:
        j = None

    print("Plotting...")
    lines, labels = [], []
    plot_n = 1
    axes = {}
    n_graphs = len(set([key for events in events_by_log_dir.values() for key in events.keys()])) + 1
    subplot_dims = (int(ceil(n_graphs / args.n_cols)), args.n_cols)
    figure(figsize=(6 * subplot_dims[1], 4 * subplot_dims[0]))
    for log_dir_n, (log_dir, events) in enumerate(events_by_log_dir.items()):
        print(log_dir)
        color = f"C{log_dir_n}"
        label = log_dir[i:j]
        for key, events in events.items():
            if key not in axes:
                axes[key] = subplot(*(subplot_dims + (plot_n,)))
                plot_n += 1
            ax = axes[key]
            timestamps, values = list(zip(*events))
            relative_timestamps = [t - timestamps[0] for t in timestamps]
            relative_timestamps_hours = [t / 3600 for t in relative_timestamps]
            line = plot_values(ax, values, relative_timestamps_hours, 'Value', 'Time (hours)', key,
                               label=label, color=color, smoothing=args.smoothing)
            lines.append(line)
            labels.append(label)

    unique_lines = []
    unique_labels = []
    for line, label in zip(lines, labels):
        if label not in unique_labels:
            unique_labels.append(label)
            unique_lines.append(line)
    figlegend(unique_lines, unique_labels, loc='upper center')
    tight_layout(rect=[0, 0, 1, 0.90])

    print("Saving figure...")
    # Removing trailing slashes
    normed_log_dirs = [os.path.normpath(d) for d in args.log_dir]
    if len(args.log_dir) == 1:
        out_filename = os.path.basename(normed_log_dirs[0])
    else:
        longest_common_prefix = os.path.commonprefix(normed_log_dirs)
        longest_common_suffix = os.path.commonprefix([d[::-1] for d in normed_log_dirs])[::-1]
        out_filename = longest_common_prefix + '*' + longest_common_suffix + '.png'
    savefig(out_filename)


if __name__ == '__main__':
    main()
