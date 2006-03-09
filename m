From: "Brown, Len" <len.brown@intel.com>
Subject: RE: System completely hangs using acpi_cpufreq
Date: Thu, 9 Mar 2006 00:29:19 -0500
Message-ID: <F7DC2337C7631D4386A2DF6E8FB22B3006523B53@hdsmsx401.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-acpi-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrey Borzenkov <arvidjaar@mail.ru>, linux-acpi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Please open a bugzilla here
http://bugzilla.kernel.org/enter_bug.cgi?product=ACPI

Attach the output from acpidump, available in pmtools here:
http://ftp.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/

paste the contents of /proc/cpuinfo attach the dmesg.

Please verify if speedstep_centrino loads, and if you see
different behaviour with that over acpi-cpufreq.

Also, please show what governor is being used,
and if setting it to constant, say with "performance"
makes the problem go away.

thanks,
-Len
