From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Custom powerstates table in powernow-K7 ?
Date: Mon, 20 Dec 2004 13:50:09 +0100
Message-ID: <20041220125009.GN2140@poupinou.org>
References: <20041218212452.DFAA849C33@nathan.muc.de>
	<20041219105743.31456.qmail@web53908.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041219105743.31456.qmail@web53908.mail.yahoo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Simonov <a_simonov@yahoo.com>
Cc: cpufreq@www.linux.org.uk

On Sun, Dec 19, 2004 at 02:57:43AM -0800, Alex Simonov wrote:
> Hi all,
> 
> Is there any simple way to use the powernow-k7
> driver with custom PST? Until now (kernel 2.6.3)
> I've always used to patch the module, hardwiring
> my own PST table for my Mobile Athlon XP 1900+,
> but with 2.6.8 kernels it seems more complex,
> with all this ACPI stuff added to it. It is not
> enough anymore to patch the 
> powernow_decode_bios (int maxfid, int startvid)
> function any more ..:(

At first, are you sure going with ACPI didn't help?  If that is the
case, I don't see the difficulty to do what you ask, especially if you
have already done such hack (ACPI is a fallback, so unless your laptop
is in a DMI blacklist, hacking powernow_decode_bios() should work).

> Could you give me some hints please? May be there
> is opportunity to pass it as a parameter to the
> cpufreq module? Or a way to integrate it in the
> initrd.img?

I'm afraid nobody will integrate that in mainline.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
