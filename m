From: Carl Thompson <cet@carlthompson.net>
Subject: Re: dumb question from curious newbee.
Date: Sat, 21 Jun 2003 12:35:49 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056224149.ef4e0e799ffee@carlthompson.net>
References: <1056093725.15596.2.camel@localhost>
	<20030620174437.GB1889@brodo.de> <200306210048.52920.lawa@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <200306210048.52920.lawa@gmx.at>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Quoting Gregor Hlawacek <lawa@gmx.at>:

> ...

> > No, there's no frequency scaling for AMD Duron. But maybe throttling
> > (power consumption is reduced linear to processing power) is available
> -
> > try out ACPI [http://acpi.sf.net for more information]
>
> Maybe I miss understood the whole cpufreq thing. but doesn't the cpufreq
> thing do exactly that thing. My AMD Duron 1.1 GHz can be slowed down to
> 500MHz with your backport from cpufreq to 2.4.19, or did I get something
> wrong

The Regular AMD Duron has no support for PowerNow, and hence no support for
CPUFreq.  Some versions of the AMD Mobile Duron _do_ have support for
PowerNow and CPUFreq.  You probably have an AMD Mobile Duron, not an AMD
Duron.  Different chip.

Carl Thompson


>
> Gregor
>
> btw: will there be any backport of powernow-k7 to 2.4.21?
>
>
> --
> Gregor Hlawacek                                                  Austria
> http://www.unileoben.ac.at/~m9327555/        May the source be with you!
>  This posting is 100% M$ free. Guaranteed by Tux, the friendly penguin.
>
