From: Ronald van der Meer <revdmeer@conceptsfa.nl>
Subject: Re: Mobile Intel Pentium 4 + ICH5
Date: Fri, 13 Feb 2004 07:10:25 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1076652625.4339.6.camel@laptop>
References: <1076542663.4323.17.camel@laptop>
	<402B6516.1030408@basmevissen.nl> <1076610612.4491.42.camel@laptop>
	<20040213001555.GD13262@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040213001555.GD13262@poupinou.org>
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
To: cpufreq mailing list <cpufreq@www.linux.org.uk>


On Fri, 2004-02-13 at 01:15, Bruno Ducrot wrote:
> On Thu, Feb 12, 2004 at 07:30:12PM +0100, Ronald van der Meer wrote:
> > Hi,
> > 
> > > BTW. What labtop do you have?
> > 
> > It's a Medion MD40100, for more info on it's internals check
> > http://home.conceptsfa.nl/~revdmeer/md40100/
> > 
> 
> Could you please send 'lspci -n' ?

00:00.0 Class 0600: 8086:2570 (rev 02)
00:01.0 Class 0604: 8086:2571 (rev 02)
00:1d.0 Class 0c03: 8086:24d2 (rev 02)
00:1d.1 Class 0c03: 8086:24d4 (rev 02)
00:1d.2 Class 0c03: 8086:24d7 (rev 02)
00:1d.3 Class 0c03: 8086:24de (rev 02)
00:1d.7 Class 0c03: 8086:24dd (rev 02)
00:1e.0 Class 0604: 8086:244e (rev c2)
00:1f.0 Class 0601: 8086:24d0 (rev 02)
00:1f.1 Class 0101: 8086:24db (rev 02)
00:1f.3 Class 0c05: 8086:24d3 (rev 02)
00:1f.5 Class 0401: 8086:24d5 (rev 02)
00:1f.6 Class 0703: 8086:24d6 (rev 02)
01:00.0 Class 0300: 10de:032c (rev a1)
03:04.0 Class 0607: 104c:ac8e
03:04.1 Class 0607: 104c:ac8e
03:04.2 Class 0c00: 104c:802e
03:04.3 Class 0180: 104c:ac8f
03:05.0 Class 0200: 10ec:8139 (rev 10)
03:06.0 Class 0280: 1260:3890 (rev 01)

> BTW, I don't see an ICH-5 mobile version on intel site yet ?

I don't think it's a special mobile version. Probably this one:
http://developer.intel.com/design/chipsets/datashts/252523.htm

would this totally rule out the using speedstep which the CPU does seem
to support? 
