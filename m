From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Wed, 3 Sep 2003 09:31:07 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030903073107.GX4401@poupinou.org>
References: <871xuzbycu.wl%miura@da-cha.org>
	<20030902053557.GA28724@gamma.logic.tuwien.ac.at>
	<87fzjejz9j.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <87fzjejz9j.wl%miura@da-cha.org>
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
To: Hiroshi Miura <miura@da-cha.org>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 01:02:00PM +0900, Hiroshi Miura wrote:
> 
> 
> At Tue, 2 Sep 2003 07:35:57 +0200,
> Norbert Preining wrote:
> > 
> > I am ready to try it, but need a patch against 2.4(22,23pre):
> > 
> > model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 2.20GHz
> > stepping        : 7
> > 
> > cpufreq: Intel(R) SpeedStep(TM) for this chipset not (yet) available.
> > cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available

> I think you can use speedstep-centrino driver or acpi P-state instead.

No, it is not a banias.  But speedstep-ich should work, though.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
