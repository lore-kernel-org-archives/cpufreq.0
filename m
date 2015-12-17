From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 71841] cpufreq ondemand ignore_nice_load doesn't work
Date: Thu, 17 Dec 2015 05:26:59 +0000
Message-ID: <bug-71841-12968-dUcMQvrYqN@https.bugzilla.kernel.org/>
References: <bug-71841-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-71841-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71841

--- Comment #2 from Chen Yu <yu.c.chen@intel.com> ---
The ignore_nice_load works on my side on 4.4-rc5, here's my testing step:

with ignore_nice_load enabled

1.root@Surface-Pro-3:/sys/devices/system/cpu/cpufreq/ondemand# echo 1 >
ignore_nice_load

2.spin a nice(1) task on CPU2:
root@Surface-Pro-3:/sys/devices/system/cpu/cpufreq/ondemand# taskset -c 2 nice
-n1 stress -c 1 -t 200


3.top result for CPU2 load:

top - 03:10:58 up 25 min,  4 users,  load average: 0.85, 0.44, 0.21
Tasks: 237 total,   2 running, 235 sleeping,   0 stopped,   0 zombie
%Cpu0  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa
%Cpu1  :  0.4 us,  0.4 sy,  0.0 ni, 99.2 id,  0.0 wa
%Cpu2  :  0.0 us,  0.0 sy,100.0 ni,  0.0 id,  0.0 wa
%Cpu3  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa


4. turbostat -i 10
 CPU Avg_MHz   %Busy Bzy_MHz TSC_MHz
       -     325   25.03    1300    2494
       0       1    0.05    1300    2494
       2    1297  100.00    1300    2494
       1       1    0.05    1300    2494
       3       0    0.03    1301    2494



5.  wait for step 4 to finish, then spin a nice(0) task on CPU 2:
root@Surface-Pro-3:/sys/devices/system/cpu/cpufreq/ondemand# taskset -c 2
stress -c 1 -t 200

6. top
top - 03:14:27 up 28 min,  4 users,  load average: 0.86, 0.61, 0.33
Tasks: 233 total,   2 running, 231 sleeping,   0 stopped,   0 zombie
%Cpu0  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa
%Cpu1  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa
%Cpu2  :100.0 us,  0.0 sy,  0.0 ni,  0.0 id,  0.0 wa
%Cpu3  :  0.0 us,  0.3 sy,  0.0 ni, 99.7 id,  0.0 wa

7. turbostat -i 10

CPU Avg_MHz   %Busy Bzy_MHz TSC_MHz
       -     724   25.01    2900    2494
       0       1    0.02    2842    2494
       2    2892   99.98    2900    2494
       1       0    0.02    2600    2494
       3       1    0.02    2601    2494

-- 
You are receiving this mail because:
You are the assignee for the bug.
