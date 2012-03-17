From: Jay Wineinger <jay.wineinger@gmail.com>
Subject: powernow-k8: transition frequency failed
Date: Sat, 17 Mar 2012 16:21:08 -0500
Message-ID: <CAL-9x22Ea7pKMa_-f3ggTqUvK8fxvjBBZK4PsWrd8UgHRUBy8Q@mail.gmail.com>
References: <CAL-9x20nPAef+NU6R6xPg1VL3GYj5RBctuoKp-cAEjC7mC1NRA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=s4+nh+BSVwRAJ48+E4Fh/Mo/rgujJrQJGBBr3nzBfg0=;
        b=IjAvk6FK+IuNuvhDtQUgXeghMB/4rZe7FGE841J2h82vBu83FdWfMtxdHfaSufR4vc
         O9Zf3VUGmua5LKA+7cP1qtwlD4tsSScqsEp1b53eJY8jxC9Fm9/Xn3KthPU0pTRbaIt7
         RsM6h7BKhzNuZuSc0hn5H+HNpVRw1yk9xrW9/lW3Qn7vQrbwGFN/kRcC305o6Pss6Hw6
         y5vHo88/vDsKdMtaWgrfGCLJ1DoAExVQjDLtIV4fYTSeOyXuStnR02PINvthsPmdSjdz
         LX1T3Puxxrw6BVpVbxmNyNH5VfFd1pnE3iMqoUbpXFMxsdvxOyPsgzZYRd3V06gzzSyM
         k7Vw==
In-Reply-To: <CAL-9x20nPAef+NU6R6xPg1VL3GYj5RBctuoKp-cAEjC7mC1NRA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

Hi,

My kern.log is getting spammed with about 20 "powernow-k8: transition
frequency failed" messages per second. Is there a fix for this? =A0I've
got a AMD Phenom II X6 1055T (2.8GHz).

thanks!
Jay


Here is some info about my system. I'm happy to provide more, I just
don't know what would be useful. =A0Ubuntu 11.10 system.

Linux black-tower 3.0.0-16-generic-pae #28-Ubuntu SMP Fri Jan 27
19:24:01 UTC 2012 i686 athlon i386 GNU/Linux

cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 2.80 GHz
  available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
  current policy: frequency should be within 800 MHz and 2.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.20 GHz (asserted by call to hardware).
  cpufreq stats: 2.80 GHz:10.26%, 2.20 GHz:89.74%, 800 MHz:0.00%  (5748=
5)
analyzing CPU 1:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 2.80 GHz
  available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
  current policy: frequency should be within 800 MHz and 2.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.20 GHz (asserted by call to hardware).
  cpufreq stats: 2.80 GHz:11.12%, 2.20 GHz:88.88%, 800 MHz:0.00%  (5292=
9)
analyzing CPU 2:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 2.80 GHz
  available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
  current policy: frequency should be within 800 MHz and 2.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.80 GHz (asserted by call to hardware).
  cpufreq stats: 2.80 GHz:21.62%, 2.20 GHz:78.38%, 800 MHz:0.00%  (3605=
6)
analyzing CPU 3:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 2.80 GHz
  available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
  current policy: frequency should be within 800 MHz and 2.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.20 GHz (asserted by call to hardware).
  cpufreq stats: 2.80 GHz:23.84%, 2.20 GHz:76.16%, 800 MHz:0.00%  (4678=
9)
analyzing CPU 4:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 4
  CPUs which need to have their frequency coordinated by software: 4
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 2.80 GHz
  available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
  current policy: frequency should be within 800 MHz and 2.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.80 GHz (asserted by call to hardware).
  cpufreq stats: 2.80 GHz:39.87%, 2.20 GHz:60.13%, 800 MHz:0.00%  (7300=
6)
analyzing CPU 5:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 5
  CPUs which need to have their frequency coordinated by software: 5
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 2.80 GHz
  available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
  current policy: frequency should be within 800 MHz and 2.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.20 GHz (asserted by call to hardware).
  cpufreq stats: 2.80 GHz:25.12%, 2.20 GHz:74.88%, 800 MHz:0.00%  (5103=
9)
