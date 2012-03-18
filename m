From: Jay Wineinger <jay.wineinger@gmail.com>
Subject: Re: powernow-k8: transition frequency failed
Date: Sun, 18 Mar 2012 14:46:19 -0500
Message-ID: <CAL-9x22y6EzMNGvk7Prt-b5PVAuX3BQ7S-m=onWbghVX+WWkpQ@mail.gmail.com>
References: <CAL-9x20nPAef+NU6R6xPg1VL3GYj5RBctuoKp-cAEjC7mC1NRA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=rU6KHQRJM1rEPxywdsfle31u450ghgVS6fXxQgwbmKk=;
        b=fwgo0pvfcf1GUu4OUzclWR1RRt1nsomDY+QEYkc0QEm2LTbwU7ecWWt5DUDe58kNoi
         SpHwFchZ5f6hCSxAVI2jQ8PRcsKECrWHurm960JcMP0/+aFvLTTyRuqULrLa8ZCldn68
         P5T9t5rknynks4t0sy2qhZRxtAlH/+cMa+uY2OiVIAoY2KEILWroswz+ffSMKE8toGKu
         2krEtvstqKYXQMNNZ9CQQ6Df6Kvx1QA2ZI3e8T3wqmD5xR9alHFkp0SABYpDR3VRpJRG
         t8/fFgIeY79e8wnSdUkaO0SZ6lSaWMr8gsGe7z5KUsbEHUXH7LmN1ZlncPWhKM+nF8S+
         S+Ng==
In-Reply-To: <CAL-9x20nPAef+NU6R6xPg1VL3GYj5RBctuoKp-cAEjC7mC1NRA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

Hi again,

I believe I've been able to resolve this by performing a BIOS update
on my motherboard.  I confess ignorance about how all of this works,
but it would appear that my motherboard didn't know enough about my
CPU to use it correctly.  Before the BIOS update, /proc/cpuinfo and
other tools would just tell me that I was using an unknown or generic
(I can't remember the wording) AMD processor; after the update, it
correctly identifies my "AMD Phenom(tm) II X6 1055T Processor". Also,
before the update only 3 frequency steps were available: 2.80 GHz,
2.20 GHz, 800 MHz;  Now a fourth is available and all of them are
being used: 2.80 GHz, 2.20 GHz, 1.50 GHz, 800 MHz.  And finally, I am
not receiving the mentioned messages in me kern.log anymore.

Jay

On Sat, Mar 17, 2012 at 4:15 PM, Jay Wineinger <jay.wineinger@gmail.com=
> wrote:
> Hi,
>
> My kern.log is getting spammed with about 20 "powernow-k8: transition
> frequency failed" messages per second. Is there a fix for this? =A0I'=
ve got a
> AMD Phenom II X6 1055T (2.8GHz).
>
> thanks!
> Jay Wineinger
>
>
> Here is some info about my system. I'm happy to provide more, I just =
don't
> know what would be useful. =A0Ubuntu 11.10 system.
>
> Linux black-tower 3.0.0-16-generic-pae #28-Ubuntu SMP Fri Jan 27 19:2=
4:01
> UTC 2012 i686 athlon i386 GNU/Linux
>
> cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq@vger.kernel.org, please.
> analyzing CPU 0:
> =A0 driver: powernow-k8
> =A0 CPUs which run at the same hardware frequency: 0
> =A0 CPUs which need to have their frequency coordinated by software: =
0
> =A0 maximum transition latency: 8.0 us.
> =A0 hardware limits: 800 MHz - 2.80 GHz
> =A0 available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
> =A0 available cpufreq governors: conservative, ondemand, userspace, p=
owersave,
> performance
> =A0 current policy: frequency should be within 800 MHz and 2.80 GHz.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "ondemand" may decid=
e which speed to use
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
> =A0 current CPU frequency is 2.20 GHz (asserted by call to hardware).
> =A0 cpufreq stats: 2.80 GHz:10.26%, 2.20 GHz:89.74%, 800 MHz:0.00% =A0=
(57485)
> analyzing CPU 1:
> =A0 driver: powernow-k8
> =A0 CPUs which run at the same hardware frequency: 1
> =A0 CPUs which need to have their frequency coordinated by software: =
1
> =A0 maximum transition latency: 8.0 us.
> =A0 hardware limits: 800 MHz - 2.80 GHz
> =A0 available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
> =A0 available cpufreq governors: conservative, ondemand, userspace, p=
owersave,
> performance
> =A0 current policy: frequency should be within 800 MHz and 2.80 GHz.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "ondemand" may decid=
e which speed to use
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
> =A0 current CPU frequency is 2.20 GHz (asserted by call to hardware).
> =A0 cpufreq stats: 2.80 GHz:11.12%, 2.20 GHz:88.88%, 800 MHz:0.00% =A0=
(52929)
> analyzing CPU 2:
> =A0 driver: powernow-k8
> =A0 CPUs which run at the same hardware frequency: 2
> =A0 CPUs which need to have their frequency coordinated by software: =
2
> =A0 maximum transition latency: 8.0 us.
> =A0 hardware limits: 800 MHz - 2.80 GHz
> =A0 available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
> =A0 available cpufreq governors: conservative, ondemand, userspace, p=
owersave,
> performance
> =A0 current policy: frequency should be within 800 MHz and 2.80 GHz.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "ondemand" may decid=
e which speed to use
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
> =A0 current CPU frequency is 2.80 GHz (asserted by call to hardware).
> =A0 cpufreq stats: 2.80 GHz:21.62%, 2.20 GHz:78.38%, 800 MHz:0.00% =A0=
(36056)
> analyzing CPU 3:
> =A0 driver: powernow-k8
> =A0 CPUs which run at the same hardware frequency: 3
> =A0 CPUs which need to have their frequency coordinated by software: =
3
> =A0 maximum transition latency: 8.0 us.
> =A0 hardware limits: 800 MHz - 2.80 GHz
> =A0 available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
> =A0 available cpufreq governors: conservative, ondemand, userspace, p=
owersave,
> performance
> =A0 current policy: frequency should be within 800 MHz and 2.80 GHz.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "ondemand" may decid=
e which speed to use
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
> =A0 current CPU frequency is 2.20 GHz (asserted by call to hardware).
> =A0 cpufreq stats: 2.80 GHz:23.84%, 2.20 GHz:76.16%, 800 MHz:0.00% =A0=
(46789)
> analyzing CPU 4:
> =A0 driver: powernow-k8
> =A0 CPUs which run at the same hardware frequency: 4
> =A0 CPUs which need to have their frequency coordinated by software: =
4
> =A0 maximum transition latency: 8.0 us.
> =A0 hardware limits: 800 MHz - 2.80 GHz
> =A0 available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
> =A0 available cpufreq governors: conservative, ondemand, userspace, p=
owersave,
> performance
> =A0 current policy: frequency should be within 800 MHz and 2.80 GHz.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "ondemand" may decid=
e which speed to use
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
> =A0 current CPU frequency is 2.80 GHz (asserted by call to hardware).
> =A0 cpufreq stats: 2.80 GHz:39.87%, 2.20 GHz:60.13%, 800 MHz:0.00% =A0=
(73006)
> analyzing CPU 5:
> =A0 driver: powernow-k8
> =A0 CPUs which run at the same hardware frequency: 5
> =A0 CPUs which need to have their frequency coordinated by software: =
5
> =A0 maximum transition latency: 8.0 us.
> =A0 hardware limits: 800 MHz - 2.80 GHz
> =A0 available frequency steps: 2.80 GHz, 2.20 GHz, 800 MHz
> =A0 available cpufreq governors: conservative, ondemand, userspace, p=
owersave,
> performance
> =A0 current policy: frequency should be within 800 MHz and 2.80 GHz.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "ondemand" may decid=
e which speed to use
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
> =A0 current CPU frequency is 2.20 GHz (asserted by call to hardware).
> =A0 cpufreq stats: 2.80 GHz:25.12%, 2.20 GHz:74.88%, 800 MHz:0.00% =A0=
(51039)
