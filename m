From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: What AMD CPU is that ???
Date: Thu, 15 Jan 2004 13:12:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040115121215.GS14031@poupinou.org>
References: <20040114221322.GA2135@seneca.muc.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040114221322.GA2135@seneca.muc.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Milz <hm@seneca.muc.de>
Cc: Cpufreq@www.linux.org.uk

On Wed, Jan 14, 2004 at 11:13:22PM +0100, Harald Milz wrote:
> Hi,
> 
> I dug a little bit more into my new (alleged?) AMD Athlon XP-M 2400+
> (Barton) using x86info-1.12a. According to the 512K cache it is
> indeed a Barton core but I suspect it's not a mobile. Please
> see the output of x86info and /pro/cpuinfo - the kernel (SuSE
> 2.4.21-166) says it's a Duron !). Essentially, I can't set
> the upper and lower frequency using /proc/cpufreq. According to
> http://fab51.fc2web.com/pc/refs/opn_guide.html, it is indeed a "Mainstream
> XP-M" (AXMH2400FQQ4C). Any idea why setting FID and VID don't work? What
> also worries me is the max FID of 13.5 which means I can't run this CPU at
> 18x100? Does that mean I need to get another board (one with a real FSB133
> and a BIOS that recognized this CPU)? ACPI won't work here because it's a
> Asus A7V board that the kernel will force to acpi=oldboot. 
> 

x86info is broken in order to know if you can set VID/FID.
This processor can only have a mult of 13.5 at max.

For the rest of your question, I don't know.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
