From: Stefan Buettcher <stefan@buettcher.org>
Subject: Re: Interl XScale pxa cpufreq driver
Date: Mon, 22 Mar 2004 16:13:14 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <405F028A.9030004@buettcher.org>
References: <120c01c41017$712e04b0$76f02e93@rodin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <120c01c41017$712e04b0$76f02e93@rodin>
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

Young-Jin Kim wrote:
> Hi, 
> I know there is no cpufreq driver which supports XScale PXA processor.

There is one. You could have a look at the kernel sources
of the ARM Linux project or the Familiar distribution. I worked
on a project that involved DVS on a PXA board. At least the
frequency scaling part should be freely available. For voltage
scaling, we used a proprietary driver. The only problem I
encountered was some instability of the USB driver when many
frequency changes were done.

Stefan
