From: vichy <vichy.kuo@gmail.com>
Subject: about system time incorrect after changing cpu frequency
Date: Mon, 31 Aug 2015 22:03:33 +0800
Message-ID: <CAOVJa8GTDj3UJpgUd4nH1wknUKa6fgac=1SsqC8g=UCG0MGuDw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=EwpzcuikZ+REqcvlRS0ICeifOcQsjP8mGFIdE3JIJc8=;
        b=aR8eOe1wAFpyZiFuoCmIYlboj13nNJuAcguglmPMQl/p4PvxCZcap7MU6exO/QYd3q
         4vUvuY6sFEhZOU1D2qMC8+wzNRUET9+sVfd0mgqFWzYtQW2wWZtjFn/IN0/BKDtTI24S
         z6UQbZF84QRa+SXhX4xUQQ1D1mofG3HKqOtfyoa84+nS0yS/tl22Ysk0jZCNLaLhUmKS
         idSvoHD+g39tAZ+30AT/NNjF3lkHHjtLW65ha/EIKOb8xBrK0kYZSXc130P1mHa8MFw4
         ifOcth45c0HFIkSUYAFnxQO2735LQaqOcJJczUTZHmagUZZbB7Vqw5Ffh1wJq85ysoBP
         LJXg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

hi all:
My platform is like below:
1. single core Cortex A9
2. use global timer for system timer

after I porting cpu frequency driver based on snow ball, the cpu
frequency did change as I expected.
But the system time is incorrect( since pherial clk is got from cpu frequency)

for example:
a) cpu 1G (pherial clk = 250M) --> sleep 1 sec (OK)
b) cpu 500M  (pherial clk = 125M) --> sleep 1 sec (will be measured as 2 sec)

I try to call below 2 functions to change the frequency of clocksource
and clockevent, but the above b) sleep time is still incorrect when
cpu runs in 500Mhz.
    clockevents_update_freq(this_cpu_ptr(gt_evt), gt_clk_rate);
    __clocksource_updatefreq_hz(&gt_clocksource, gt_clk_rate);

in Arm cortex A9 single core system with Global timer as system timer,
is there any kernel api to change system timer period when cpu/pherial
frequency change?

appreciate your kind help in advance,
