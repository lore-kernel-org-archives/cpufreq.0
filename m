From: kernel kernel <kernel@kenobrien.org>
Subject: /sys/ file access
Date: Fri, 12 Jul 2013 09:55:46 +0100
Message-ID: <CAG=jzgD=bKTAbGtTG81XRhyBzNHtr-p-Uyh-2A5eQe0ruKkqsw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

I wish to read the file "/sys/devices/system/cpu/cpu0/cpufreq" as an
unprivileged user. The default permissions on this file are:

-r-------- 1 root root

What is the rationale behind this? All other files in this directory
are world readable.

Best Regards,

Ken

--
Ken O'Brien
PhD Researcher
Simulation Science and Extreme Events Cluster,
3B1, UCD CASL,
8 Belfield Business Park,
Dublin 4,
Ireland.
