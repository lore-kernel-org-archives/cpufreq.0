From: Harald Milz <milz@seneca.muc.de>
Subject: Re: Manual PST settings for "unrecognized CPUs"
Date: Thu, 19 Aug 2004 02:19:10 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040819001910.320EE4BE98@nathan.muc.de>
References: <FE0E4E3EC4669A46A5D2E835957A9FFF169A0699@uranus.wallst.com>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Davin Carter <davin.carter@wallst.com> wrote:
> I was able to get a Mobile Athlon 2400 down to ~300 MHZ (the lowest
> multiplier) without any problem.  Unfortuantely, my core voltage is 1.44
> volts, there did not seem to be any power savings below 1000 MHZ with my
> machine.

Are you saying you could get ~300 MHz with 1.44V? Hmmm - interesting. What
board is it? 

After all power consumption goes linear with clock, and by square with
Vcore. 

-- 
An exotic journey in downtown Newark is in your future.
