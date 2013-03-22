From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V3 2/4] cpufreq: governor: Implement per policy instances
 of governors
Date: Fri, 22 Mar 2013 17:21:19 +0530
Message-ID: <CAOh2x=n8G+g8EE-9mGovbiB-oXV3pP3bWUds8noATSc3LEYJ8A@mail.gmail.com>
References: <cover.1362381470.git.viresh.kumar@linaro.org>
	<2565053.YP0dCLmaW9@vostro.rjw.lan>
	<CAKohpomDK+FQvhZsy672P+Q4U1s2AGtJ2QizFTaNqjMRh19G0g@mail.gmail.com>
	<1483775.d1txvSJx9o@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=7bcCgwSMPkgTDHoU7zkuC/9L09gvl9oKiuQ/JAlxQMk=;
        b=Xv1irJMKLnlzNezinsMtEc1t/8c6/9z1Sj1/xGDWkf2gZx8cXxDfxmaarj4SDrJFjW
         xno4wagRpI151ShPfBX42fesXKcqXppsavcW73mj+bU8/iILZFyMpMlBmyHmb38vYVRA
         hDBue/JLSpEETn3KanCN598eM46ei5FtvO2SQXrjLjwDYGzNcv68AzIOrrOOnDocCKrf
         K4VljK0LLag2dFMvlH+ZwBrzyTnUgG+dXFyncUkUBbcGH4378Hzje2zOHA6X5Dvwgp8D
         0hzymw32qFo3SZg2fvYBCQtQmcc3Has+qVHLjAuLZuPaLoF7fhPfuesNER2/94svoGai
         6XYQ==
In-Reply-To: <1483775.d1txvSJx9o@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com

On Fri, Mar 22, 2013 at 5:25 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Friday, March 22, 2013 07:50:54 AM Viresh Kumar wrote:

>> Hmm... I always thought fixups are way easy to review (and i still
>> believe that's
>> true) as they just contain what got changed and so people don't have to review
>> whole patch again.
>
> They won't have to if you write in the preamble what the differences from
> previous versions are.

You didn't get me.. How will the reviewer check if author has done what he
is saying in preamble and he hasn't broken anything new?

>> BUT people who are looking for complete patches to apply
>> would be annoyed by this and hence i always show them path of my repo
>> where they can find it.
>
> The problem with this approach is that the complete patches never make it to
> the mailing lists and people have problems with connecting commits to
> previously posted patches.
>
> Moreover, it is *much* more convenient to me to take patches from kernel.org
> patchwork than from your repos, with all due respect.

I understand.. I push them to repo only when they are broken, otherwise not.
