From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Broken PST for Sony Vaio FX-502 with Athlon XP 1900+ fixed !
Date: Tue, 7 Oct 2003 11:31:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031007093146.GC11391@poupinou.org>
References: <20031001174844.GH11391@poupinou.org>
	<20031006153729.32725.qmail@web20806.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031006153729.32725.qmail@web20806.mail.yahoo.com>
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
To: Alex Simonov <a_simonov@yahoo.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Oct 06, 2003 at 08:37:29AM -0700, Alex Simonov wrote:
> 
> --- Ducrot Bruno <ducrot@poupinou.org> wrote:
> > On Wed, Oct 01, 2003 at 07:13:13AM -0700, Alex
> > Simonov wrote:
> > 
> > I think you can replace the powernow-k7.c of
> > your kernel
> > with the cvs version, without changing all.
> > 
> > There are not enough change in core (yet) with
> > the one
> > you have I guess.
> 
> 
> Hi Bruno, 
> 
> Thank you very much for the advice. I took the
> powernow-k7.c from the CVS, and compiled it with
> my "fake" PST. I had to fix only the missing
> define for the wrmsrl and rdmsrl symbols. So far
> the powernow scaling for my XP 1900+ seems to
> work. 
> Just one question-the x86info utility displays
> either "Voltage changes wont happen" or Frequency
> changes wont happen" depending on that if you're
> changing the speed up or down, because of the
> CVID and CFID bits set to 0 in each change_fid or
> change_vid function?

Bug in x86info perhaps?
Ah yes.  that look like this, in AMD/powernow.c:

     62         if (read_msr(cpu->number, MSR_FID_VID_CTL, &vidctl.val) != 1) {
     63                 printf ("Something went wrong reading MSR_FID_VID_CTL\n");
     64                 return;
     65         }
     66 
     67         printf ("FID changes %s happen\n", vidctl.FIDC ? "will" : "won't");
     68         printf ("VID changes %s happen\n", vidctl.VIDC ? "will" : "won't");
     69 
     70         if (vidctl.VIDC)
     71                 printf ("Current VID multiplier code: %0.3f\n", mobile_vid_table[vidctl.VID]);
     72         if (vidctl.FIDC)
     73                 printf ("Current FSB multiplier code: %.1f\n", fid_codes[vidctl.FID]);

but that is wrong.

> Does this mean that VID/FID
> is not changing?

They do.

> The MSR register values are set
> anyway, is there any definitive way to make sure
> if I have the correct voltage output?
> 

As pointed by Dave, just add some printk() (or dprintk) to print
raw MSR_K7_FID_VID_STATUS, or fields from a union msr_fidvidstatus.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
