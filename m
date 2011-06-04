From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] Add cpufreq driver for Momentum Maple boards
Date: Sat, 4 Jun 2011 14:39:37 +0400
Message-ID: <BANLkTi=ik-7jtNWfyzfxK-ds4C+TfL7Yhg@mail.gmail.com>
References: <1305973726-28006-1-git-send-email-dbaryshkov@gmail.com>
	<BANLkTikGyV8aG1twBt7Jt_=j-fSBDiGzAg@mail.gmail.com>
	<BANLkTik6Ln1JGmN7isQ1tWPAf0upzHMvkg@mail.gmail.com>
	<1307183381.23876.27.camel@pasglop>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=TMbNeaaeuGfVcBgQkRPYAUQ7l7sQXZWw7yNvHF6zeMo=;
        b=HjlXyewlaObuxO/sz328XGH54Xv/d1Nycd3cCCPtNJ2++YTgzMDe2u9TvZrXqU4TOY
         XRp598kXk14F7mz8jSBWkMkpFCu2XZbGwpIsJQFrp+hRfVQs+YYGoBGCMCRp4LH1cXd1
         1e1gFTKgI85opIF5g5CsdekY3vguTq1oGlhNI=
In-Reply-To: <1307183381.23876.27.camel@pasglop>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On 6/4/11, Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
> On Sat, 2011-06-04 at 13:00 +0400, Dmitry Eremin-Solenikov wrote:
>> On 5/30/11, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
>> > Hello,
>> >
>> > On 5/21/11, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
>> >> Add simple cpufreq driver for Maple-based boards (ppc970fx evaluation
>> >> kit and others). Driver is based on a cpufreq driver for 64-bit
>> >> powermac
>> >> boxes with all pmac-dependant features removed and simple cleanup
>> >> applied.
>> >>
>> >> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> >> ---
>> >>  arch/powerpc/kernel/misc_64.S          |    4 +-
>> >>  arch/powerpc/platforms/Kconfig         |    8 +
>> >>  arch/powerpc/platforms/maple/Makefile  |    1 +
>> >>  arch/powerpc/platforms/maple/cpufreq.c |  317
>> >> ++++++++++++++++++++++++++++++++
>> >>  4 files changed, 328 insertions(+), 2 deletions(-)
>> >>  create mode 100644 arch/powerpc/platforms/maple/cpufreq.c
>> >
>> > What about this patch?
>>
>> Pinging again. Any problems/comments/objections to this patch?
>
> Well, obviously nobody had time to review it yet....

I'm just a bit impatient. It has been already two weeks...

-- 
With best wishes
Dmitry
