From: Dave Jones <davej@redhat.com>
Subject: Re: When exactly should I worry?
Date: Sat, 4 Sep 2004 02:54:34 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040904015434.GB26517@redhat.com>
References: <E1C3FYD-0005fc-EX@www.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <E1C3FYD-0005fc-EX@www.linux.org.uk>
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
Content-Transfer-Encoding: 7bit
To: Bryce as root <root@www.linux.org.uk>
Cc: cpufreq@www.linux.org.uk, Russell King <rmk@www.linux.org.uk>

On Fri, Sep 03, 2004 at 04:00:29PM +0100, Bryce as root wrote:

 > Linux ZenIV.linux.org.uk 2.6.7-1.494.2.2smp #1 SMP Tue Aug 3 09:59:49 EDT 2004 i686 i686 i386 GNU/Linux

Is this one of Alan's VIA C3 toys ?
If so, the longhaul driver was seriously horked between 2.6.5 and 2.6.9rc1.
I fixed that up a week or two ago.   If you're stuck on that
kernel for whatever reason, just kill the longhaul.ko module.

		Dave
