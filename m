From: Dave Jones <davej@redhat.com>
Subject: Re: Enhanced PowerSaver driver
Date: Wed, 31 Jan 2007 17:45:06 -0500
Message-ID: <20070131224506.GA10509@redhat.com>
References: <45BC9E94.6080701@interia.pl> <20070128142543.GA1676@redhat.com>
	<45BCD520.4080308@interia.pl>
	<loom.20070131T122840-94@post.gmane.org>
	<45C114A6.4040801@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <45C114A6.4040801@interia.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@codemonkey.org.uk>

On Wed, Jan 31, 2007 at 11:13:58PM +0100, Rafał Bilski wrote:
 > [...]
 > > 
 > > I have a board (IB798) with a Via Eden CPU (a C7 deviate). On kernel 2.6.16.38 I
 > > tried to compile and load Via's longhaul driver. When I started cpufreq, the O/S
 > > crashed.
 > > 
 > This is rather bad sign. Looks like I spoke to soon.
 > > If e.g. Rafał create som patches for the original longhaul driver, from ideas
 > > based on Via's code, I will install them, test and give feedback.
 > > 
 > Thanks.
 > 
 > After looking into code I have found two things:
 > - it is using "disable bus master bit on each PCI device"... for C7?!,
 > - it is using current CPU f and vcc to find table for it. I don't like 
 > this idea. If CPU has min/max info why not use it? Strange thing in C7 
 > is that it is starting at lowest supported frequency. BIOS has to switch it 
 > to max. As You can read at viaarena, BIOS is only doing it when "optimized 
 > defaults" are loaded. Looks like it isn't default. What will happen if 
 > driver will search table for CPU running at lowest frequency? Probably 
 > processors with different max can have same min frequency.
 > 
 > Dave: Can I repost e_powersaver with "experimental" and some small 
 > changes? Sorry.

Sure, feel free.
I've got 'look at the via driver' on my TODO, but I've got a ton of stuff
to dig through after having been away for the last two weeks, so it may
take me a while to get around to it. If you beat me to it, all the better :-)

		Dave

-- 
http://www.codemonkey.org.uk
