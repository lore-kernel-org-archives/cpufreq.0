From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Mobile Intel Pentium 4 + ICH5
Date: Fri, 13 Feb 2004 18:59:00 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040213175900.GJ13262@poupinou.org>
References: <1076542663.4323.17.camel@laptop> <402B6516.1030408@basmevissen.nl>
	<1076610612.4491.42.camel@laptop>
	<20040213001555.GD13262@poupinou.org>
	<1076652625.4339.6.camel@laptop>
	<20040213092644.GA5230@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040213092644.GA5230@dominikbrodowski.de>
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
To: Ronald van der Meer <revdmeer@conceptsfa.nl>, cpufreq mailing list <cpufreq@www.linux.org.uk>

On Fri, Feb 13, 2004 at 10:26:44AM +0100, Dominik Brodowski wrote:
> On Fri, Feb 13, 2004 at 07:10:25AM +0100, Ronald van der Meer wrote:
> > I don't think it's a special mobile version. Probably this one:
> > http://developer.intel.com/design/chipsets/datashts/252523.htm
> > 
> > would this totally rule out the using speedstep which the CPU does seem
> > to support? 
> 
> Unfortunately, it does seem so. The ICH-5 is a desktop version and does
> not include the special registers necessary for speedstep control.

Indeed.  Those registers are 'reserved' as for others non-mobile ICH
version.  I really don't know what will happens if the OP force detection.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
