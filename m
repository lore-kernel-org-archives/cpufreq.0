From: Stefan Buettcher <stefan@buettcher.org>
Subject: Frequency switch latency
Date: Thu, 29 Jan 2004 12:06:06 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <200401291206.06389.stefan@buettcher.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

This is a little off-topic. In case it does not belong here: Sorry.

I am currently working on a kernel-compiler cooperation for
dynamic voltage/frequency scaling. I am doing this for Intel's
XScale PXA architecture. It has turned out that changing the
frequency on the XScale takes some hundred microseconds,
but voltage scaling takes 5-8 milliseconds (I am working with
some evaluation board with DVS support). Are there numbers
for PowerNow or SpeedStep on the web? I could not find any.

Another question: I have seen that there are cases in which
energy can be saved by not only changing the CPU frequency/
voltage but also the memory frequency. This is especially true
when a process with high cache efficiency is executed. We
simply do not need the memory then. Are there any plans for
integrating memory speed into the CPUfreq code sometime in
the future?

Regards

  Stefan
