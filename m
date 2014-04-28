From: Mascha Kurpicz <mascha.kurpicz@unine.ch>
Subject: time_in_state on Ubuntu 13.10
Date: Mon, 28 Apr 2014 16:43:18 +0200
Message-ID: <535E6906.2090201@unine.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org
Cc: Maxime Colmant <maxime.colmant@inria.fr>

Hi,

First of all I would like to thank for the cpufreq utility that I use
regularly.

Unfortunately, when upgrading our systems from Ubuntu 12.04 to 13.10, we
are encountering some issues with the data in
/sys/devices/system/cpu/cpu*/cpufreq/stats/time_in_state.

On some of the machines, the values are all set to 0 [1], whereas on
other machines, values are 0 or very small [2]. In both cases, the
output of cpufreq-info for the cpufreq stats is not correct. When
running Ubuntu 12.04, we get reasonable values.

We noticed this behavior on Intel i3 machines, and on Intel Xeon. Kernel
version in all cases is 3.11.0-20-generic.

Thanks in advance and best regards,

Mascha

---
[1]
user@ubuntu1310:~$ cat
/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
3100000 0
2800000 0
2600000 0
2400000 0
2200000 0
2000000 0
1800000 0
1600000 0

user@ubuntu1310:~$ cpufreq-info
...
 cpufreq stats: 3.10 GHz:-nan%, 2.80 GHz:-nan%, 2.60 GHz:-nan%, 2.40
GHz:-nan%, 2.20 GHz:-nan%, 2.00 GHz:-nan%, 1.80 GHz:-nan%, 1.60
GHz:-nan%  (21768)
...

[2]
user@ubuntu1310:~$ cat
/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
3100000 0
2800000 0
2600000 0
2400000 0
2200000 0
2000000 0
1800000 0
1600000 6

user@ubuntu1310:~$ cpufreq-info
...
cpufreq stats: 3.10 GHz:0.00%, 2.80 GHz:0.00%, 2.60 GHz:0.00%, 2.40
GHz:0.00%, 2.20 GHz:0.00%, 2.00 GHz:0.00%, 1.80 GHz:0.00%, 1.60
GHz:100.00%  (86356)
...

