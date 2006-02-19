From: Vince <legoll@online.fr>
Subject: Missing PSB or _PSS in BIOS
Date: Sun, 19 Feb 2006 02:45:06 +0100
Message-ID: <43F7CDA2.8030209@online.fr>
Reply-To: legoll@online.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-acpi@vger.kernel.org
Cc: cpufreq@lists.linux.org.uk, legoll@online.fr

Hello,

I'm using an opteron 165 (dual-core) which frequency/voltage should
be able to be scaled, but unfortunately the latest BIOS for my motherboard
lacks the frequency transition tables needed by powernow-k8.c

as shown by the boot message:
powernow-k8: MP systems not supported by PSB BIOS structure
powernow-k8:  BIOS error - no PSB or ACPI _PSS objects

Would it be possible to write suitable ACPI _PSS from AMD processor 
documentation ?
Or take the infos from some other ACPI BIOS which has support, and put 
it in mine ?

And use the "ACPI load custom DSDT" kernel option to get the patched one 
used by the
powernow-k8 driver ?

I found a lot of infos about fixing glitches in DSDT but could not find 
anything
about adding missing  _PSS entries...

Would that be dangerous ?

Is there something else I could do ?
I don't think I'll get an answer from the vendor, even if I tried...

Please, keep me on the CC list

-- 
Vincent Legoll



