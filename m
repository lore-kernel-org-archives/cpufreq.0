From: Parag Warudkar <parag.lkml@gmail.com>
Subject: Re: [PATCH] cpufreq/intel_pstate: Set timer timeout correctly
Date: Fri, 5 Apr 2013 19:46:04 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1304051943270.3817@gmail.com>
References: <1365096935-16730-1-git-send-email-dirk.brandewie@gmail.com> <CAOh2x=mzQBSnBB3-10yGMdGfxMWeMcvE_t2Mvnz+fvdHv0-uaA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:x-x-sender:to:cc:subject:in-reply-to
         :message-id:references:user-agent:mime-version:content-type;
        bh=zHeD2qeI6+PigA+HlausLfSn2o58iMrwBq8S1CRV3Xo=;
        b=t9vO6mPkutxsMXpLnE/m4a6lqfYx1HLEvITAJtD3SeZk6xmiUXu3LDNWvmAzsiwPcj
         1lUZ9pW/JsszVrmY8K6zbTf8CWGdKhFM8FYx4/OBUDYwGQJToNxodt+/ddOPRouCzdE+
         JMPnteZzIE822lJjQmEWzt8OG9yMkZKQUUPf2UwPk/tHR2uZu1hjpGHEoWnJOoam6qNc
         XfMxS/696gR9cJjLk1qvFSItDlDzMHF6mk8N6peFDzCeTXgM9oiR70UpqZ2WQ//GMoM/
         lZEL6k9z+9pLvfr4pzV63uwV6XVCEyGUb9hQduRWm1CQ+x56GG8G6HOVXzucZbTjQSRf
         js/g==
In-Reply-To: <CAOh2x=mzQBSnBB3-10yGMdGfxMWeMcvE_t2Mvnz+fvdHv0-uaA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: dirk.brandewie@gmail.com, Adam Williamson <awilliam@redhat.com>, Parag Warudkar <parag.lkml@gmail.com>, rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org



On Fri, 5 Apr 2013, Viresh Kumar wrote:

> On Thu, Apr 4, 2013 at 11:05 PM,  <dirk.brandewie@gmail.com> wrote:
> > From: Dirk Brandewie <dirk.brandewie@gmail.com>
> >
> > The current calculation of the delay time is wrong and a cut and paste
> > error from a previous experimental driver.  This can result in the
> > timeout being set to jiffies + 1 which setup the driver to race with
> > it's self if the apic timer interrupt happen at just the right time.
> >
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=920289
> >
> > Reported-by: Adam Williamson <awilliam@redhat.com>
> > Reported-by: Parag Warudkar <parag.lkml@gmail.com>
> >
> > Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>
> > ---
> >  drivers/cpufreq/intel_pstate.c |    1 -
> >  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> Looks fine, but I would like to see a Tested-by from Adam/Parag
> as they haven't said anything about this patch (even in bugzilla).
> 

I am running with the patch since yesterday - everything looks good.

The issue hasn't been reproducible on demand but some code reading and 
Dirk's explanation says the patch should fix the issue.

So - Tested-by: Parag Warudkar <parag.lkml@gmail.com>

Parag
