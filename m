From: Johan Braennlund <johan.brannlund@telia.com>
Subject: Cpufreq hang
Date: Wed, 16 Jul 2003 16:31:34 +0200 (CEST)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.LNX.4.53.0307161622300.30690@h192n1fls22o1048.telia.com>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi! It seems like there's a bug in cpufreq in the 2.5 kernels.

When using recent 2.5-series kernels and running on battery, cpufreqd
locks up hard when it's started. If I run on AC power, everything works
fine.

If I use a 2.4 kernel, such as 2.4.20-wolk4.0s-rc3 everything works fine,
no matter whether I run off the battery or not.

When the machine hangs, nothing appears in the logs, it just locks up and
I have to power it off. I'm using an Acer Aspire with an Athlon XP 1800+
processor.

The version of cpufreqd I'm using is 1.0-1, installed as a debian package.
I've tried compiling from source, but the result is the same.

If there's anything I can do to pinpoint the bug, please let me know.

Regards,

Johan
