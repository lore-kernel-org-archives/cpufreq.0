From: Stefan Buettcher <stefan@buettcher.org>
Subject: calling cpufreq_set
Date: Wed, 05 Nov 2003 00:44:13 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FA839CD.3070404@buettcher.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq ML <cpufreq@www.linux.org.uk>

Hi,

I am new to this list as well as cpufreq at all.

I have written a kernel module (2.4.19-something) on the
ipaq 5400. This module makes direct calls to cpufreq_set.
While the system does not break, the usb does. usbnet
suddenly stops working and will resist my efforts to work
afterwards.

When I do not do the calls from within the kernel but use
the proc file interface provided by cpufreq, the system is
stable and usb has no problems.

Has anyone experienced similar problems? Any idea why
this happens?

Stefan
