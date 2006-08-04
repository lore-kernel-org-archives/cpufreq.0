From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Why supports the speedstep-ich only 2 processor states
Date: Fri, 4 Aug 2006 10:54:32 +0200
Message-ID: <20060804085432.GN17014@poupinou.org>
References: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
	<a11ccc30608030747v16bf4f2bs3ca2ff1b09bd5d36@mail.gmail.com>
	<1154617007.23310.3.camel@skylla.slagter.name>
	<a11ccc30608030816s22bbd417pe93a00703d1f18df@mail.gmail.com>
	<1154633918.9169.15.camel@sunwork>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1154633918.9169.15.camel@sunwork>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "kay@rz.fh-augsburg.de" <kay@rz.fh-augsburg.de>
Cc: Hiroshi Miura <miura@da-cha.org>, cpufreq@lists.linux.org.uk

On Thu, Aug 03, 2006 at 08:38:38PM +0100, kay@rz.fh-augsburg.de wrote:
> Hi,
> 
> first, thanks for your answers.
> 
> Ok, I tried the throttling. And it's available two for the 191 MHz Mode.
> And you are both right, there is no power saving if idle with the
> throttling at both Modes.
> Power Saving is about 200 mW at 191 MHz compared to 733 MHz. I know it's
> not much, but I am not willing to accept that it's not possible :-).
> Because it definitly is.
> 

Maybe something is broken with power states of the processor.
What say
cat /proc/acpi/processor/*/power

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
