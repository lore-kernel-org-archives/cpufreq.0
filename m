From: Dominik Brodowski <linux@brodo.de>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Wed, 3 Sep 2003 11:06:15 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030903090615.GA22531@brodo.de>
References: <871xuzbycu.wl%miura@da-cha.org> <20030902083150.GA3958@brodo.de>
	<20030902123538.GR4401@poupinou.org>
	<20030902145452.GA8512@brodo.de>
	<20030903075726.GZ4401@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903075726.GZ4401@poupinou.org>
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

On Wed, Sep 03, 2003 at 09:57:26AM +0200, Ducrot Bruno wrote:
> On Tue, Sep 02, 2003 at 04:54:52PM +0200, Dominik Brodowski wrote:
> > the other part of the story is here: the speedstep_smi_get_freqs call does
> > not work on my system -- it returns the ist_info.signature as result, and
> > "0" and "4" as high and low frequency which is obviously bogus. Replacing it
> > with hard-coded values for testing made it go -- BTW, GPO 0 did indeed
> > change again, but changing GPO _alone_ [which is what the speedstep-piix4
> > module does] did not work.
> > 
> 
> Changing GPO alone still require a read to LVL3.  Think the same
> kind of techno like throttling (hint, hint :)

Well, with "changing GPO _alone_" I meant your speedstep-piix4 driver ;-)

	Dominik
