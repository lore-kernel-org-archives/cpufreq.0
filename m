From: Vasanth Venkatachalam <vvenkata@es.nacs.uci.edu>
Subject: cpufreq files missing in Linux 2.6.5
Date: Thu, 20 May 2004 15:56:39 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.GSO.4.30.0405201547480.13318-100000@rigel.oac.uci.edu>
References: <20040520151011.6F8694137@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040520151011.6F8694137@latitude.mynet.no-ip.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi everyone,

I am running Redhat Linux 2.6.5 and manually recompiled the kernel to
include the cpufreq modules. But I find that some essential files are
missing.

Namely,

1. The directory /sys/devices/system/cpu/cpu0 exists but is empty; there
is no cpufreq subdirectory inside it.

2. There's also no /proc/cpufreq or /proc/sys/cpu/*/speed directory.

Yet all the other files (cpufreq.c, proc_intf.c etc) appear in
the directory /usr/src/linux/drivers/cpufreq.

Can anyone explain why the files in 1 and 2 are not appearing?

Vasanth

*********

Vasanth Venkatachalam                        Office: CS/E 137
PhD Candidate				     Tel: None
School of Information and Computer Science   Email: vvenkata@uci.edu
University of California
Irvine, CA 92697-3425
