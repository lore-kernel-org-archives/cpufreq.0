From: Dominik Brodowski <linux@brodo.de>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Tue, 2 Sep 2003 16:54:52 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902145452.GA8512@brodo.de>
References: <871xuzbycu.wl%miura@da-cha.org> <20030902083150.GA3958@brodo.de>
	<20030902123538.GR4401@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030902123538.GR4401@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: Hiroshi Miura <miura@da-cha.org>, Ducrot Bruno <ducrot@arm.linux.org.uk>, cpufreq@www.linux.org.uk

Fantastic, speedstep finally works on my notebook!!! Wow... Congratulations
to Bruno Ducrot and Hiroshi Miura. 

On Tue, Sep 02, 2003 at 02:35:38PM +0200, Ducrot Bruno wrote:
> On Tue, Sep 02, 2003 at 10:31:50AM +0200, Dominik Brodowski wrote:
> > Thanks for this very interesting work. Unfortunately, it doesn't work on my
> > aged notebook, but well, the GPO driver didn't work either....
> > 
> 
> Dominik, the command is 0x80 for you, but actually it should be 0x82.
> I do have the exact same trouble with my toshiba.  Try then to pass
> the correct option in order to overide that value.  Unfortunately, I
> don't have my toshiba handy (even though it is ICH based, it
> may be usefull to play with).

0x82 was one part of the story...
 
> The flags stuff is not actually exploited.
> For mine (and for Dominik) it is 0x07d00100
> whereas Miura-san is 0x0x07d00000
> 
> When I receive report from speedstep-detect (and also send
> something called speedtep-bios privatly), if bit 8 == 1, then it do not
> work, but I don't have the ownership stuff, though.  When that
> bit is 0, it may or may not work.  I think it is related to 
> state on battery.
> 
> More related to the driver: I don't see any special reason to disable
> interrupts in-between the smi call when setting the state.  Also,
> you don't use the speedstep_get_freqs, but use a SMI function for
> that (which is probably more usefull), therefore, there is no
> need to do the notification stuff (it was done only at _init stage,
> and to avoid duplicating codes).

the other part of the story is here: the speedstep_smi_get_freqs call does
not work on my system -- it returns the ist_info.signature as result, and
"0" and "4" as high and low frequency which is obviously bogus. Replacing it
with hard-coded values for testing made it go -- BTW, GPO 0 did indeed
change again, but changing GPO _alone_ [which is what the speedstep-piix4
module does] did not work.

	Dominik
