From: kristjan <kristjan.ugrin@gmail.com>
Subject: Atlhlon 64, overclocking and cool'n'quiet
Date: Wed, 30 Mar 2011 19:07:12 +0200
Message-ID: <op.vs51uan6iuv9lm@kriko.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:content-type:subject:to:date:mime-version
         :content-transfer-encoding:from:message-id:user-agent;
        bh=ospkI52sdRp7Lb0euA3Ru9xKNJbqGp3JZ9cN0erbKa8=;
        b=nyYeVaeRBaPjfhEP5nNNXTCzTblSSyhn1YlQZHQPOH3R6bWuGgAj0+ecJBlKA4P9oU
         rIN/zKr+XyQZg44gXIxSM031CS29nfkBnSTUrZ96YvcNiMy9Z3XiiJF3XDnXjGqwa8+2
         L2ATY7L2v500peghMaKsUZw3H5m99M9rcPgTo=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: cpufreq@vger.kernel.org

Hello!

I've overclocked one workstation with athlon 64 2800+ cpu and I was able  
to get cool'n'quiet working in windows by
manually setting p-states with RMClock utility and i'm trying to achieve  
same thing under linux kernel 2.6.38.

First I've modified DSDT;
multipliers are the same, since I'm not changing those, only FSB  
frequency, which is now 260 Mhz with HT multiplier of 3, that gives:
780 + 2*130 = 1040
780 + 10*130 = 2080

I'm a bit confused though - fid multiplier is different under windows and  
in bios - there it is used x9 which conforms with highest cpu frequency  
reported
by various tools in windows:
2340 Mhz = 260 * 9 (it is actually running at 2342 - this is what various  
tools say)

but I can't get it via traditional formula.
Booting vanilla kernel without modified DSDT will give me only 1  
performance state with locked 2343 Mhz.

However setting highest pss in DSDT  to 2343 (0x0927) as highest will lead  
to non working cool'n'quiet:
----
Mar 30 18:24:02 kriko kernel: [   14.162636] powernow-k8: Found 1 AMD  
Athlon(tm) 64 Processor 2800+ (1 cpu cores) (version 2.20.00)
Mar 30 18:24:02 kriko kernel: [   14.162683] powernow-k8: invalid freq  
entries 1800000 kHz vs. 2343000 kHz
Mar 30 18:24:02 kriko kernel: [   14.162685] powernow-k8: invalid freq  
entries 1000000 kHz vs. 1040000 kHz
Mar 30 18:24:02 kriko kernel: [   14.162691] [Firmware Bug]: powernow-k8:  
invalid powernow_table
----

What the correct frequency this cpu is running if I set fsb to 260 Mhz so  
the cpufreq driver will accept it?

Thanks

-- 
Kristjan Ugrin
