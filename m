From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: static freq table support for Pentium M Dothan
Date: Wed, 18 Aug 2004 15:45:06 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1092869106.3133.1.camel@localhost>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
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
To: Michael Clark <mclark@metaparadigm.com>
Cc: michael@mage.metaparadigm.com, cpufreq list <cpufreq@www.linux.org.uk>

On Tue, 2004-08-17 at 10:51 +0800, Michael Clark wrote:
> Having all of the voltages in the code (VID#A through VID#D) is really
> more for the purposes of completeness. The VID#A voltages after some
> thought are the most conservative setting (also same as seen in the ACPI
> tables of my Thinkpad), as the max voltage of the Dothans is 1.6, having
> the higher voltage will allow for greater power supply tolerance.

I was considering this approach, but I got concerned because the voltage
ranges of VID#A and VID#D don't overlap - so by using VID#A voltages on
a #D CPU, you'd be driving it out of spec.

	J
