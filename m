From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: BUG in bleeding edge c560f3d
Date: Mon, 04 Feb 2013 14:19:22 -0800
Message-ID: <511033EA.7090604@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:content-type:content-transfer-encoding;
        bh=Jg1egWuzPWnSdn10hFMfdiuaSIy5RHl3Uz12h+JEyvE=;
        b=gVF2a46SKoK0ISR7xZs0upHxJoQUL9UYjoSrf/CpgtBCiTbWoQABTFtQdoGVI4TXDb
         x8BlAbCAjMW5xnaLM8BZdztC4QVRocKHvltrsh+ijBGbpIaxlHVNOEDPgiEFu0etazGe
         vbHMX2WmkJoHMXXdiAUf8ukWVw4NcPcW5Lt5vZs/yp/9/9kitCY6VlD34E6anqAEAzIr
         254Jr7NAXyFi/J7xj3CfMzhPJ77rIinxExqCrIB7L8fRZ9/a73q1RsWAAbWc3/UKVdNV
         6Ec2UIMv6+r1e5slLFKa9PRSgQAfKtTwyrezuxozfc0TTn/RDj0xYMm1qezivW3nmXZ8
         aNlA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org
Cc: dirk.brandewie@gmail.com

Hi All,

There is a bug in the bleeding-edge branch. Using the ondemand governor
and acpi_cpufreq scaling driver the system hangs while trying to reboot or
trying to offline a cpu manually.  The last call where I have tracing turned
on is __cpufreq_governor(data, CPUFREQ_GOV_STOP);

[   38.138236] __cpufreq_remove_dev: cpufreq: __cpufreq_remove_dev: 
unregistering CPU 1
[   38.146663] __cpufreq_governor: cpufreq: __cpufreq_governor for CPU 0, event 2
[   71.562262] ata3.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen


It looks like the breakage comes from the removal of the sysfs files in the
incorrect order.  While rebasing my patches onto bleeding edge I found this
problem as well.  I have a couple of hack patches that workaround the issue
when using my driver if anyone would like to see them.

--Dirk
