From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/2] v3.9-rc1 fixes for intel_pstate driver
Date: Wed, 6 Mar 2013 21:37:48 +0800
Message-ID: <CAOh2x=m=myFE=2=74U2XNew6FsbDichwhGTTQOyvrnayHicHzA@mail.gmail.com>
References: <1362521727-20666-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Qip1QVjEQJfA8062diy2f3IZJ0Ibax4ByRgvRoV5+1A=;
        b=UZD5zxf4JdfD5nbhXOl6WE7TDsNheT8Y78PW3Z+IWYUf3fOl1xrCWAM7nVfETkJ5v3
         4u88u99O5hYb1sxB6gvnzysiuPuuU0pN7iBXTtLn3ArnMKxdXPqZ9dH1Bvu4ppPz8XyP
         WY1QT0OlYTH0XVdA2vCcXVLU9ZoSonAxRAXR4r2Nm8k0R7x8AiMjWypNrxrWhlPsqodg
         n7TEN/4ka2Hke5QEKCwCJZ7JYD+JDO6apQpuK9C29v+PLDJhtToEODldq6D/SrBgUyOP
         HfYFz5pH0vWH6Jazshm152gsMsBrXP0J2lOkTEmQoPPYsITuYgDbBoIiQ+7sm5kfzzn0
         k44Q==
In-Reply-To: <1362521727-20666-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, konrad.wilk@oracle.com, jwboyer@redhat.com

On Wed, Mar 6, 2013 at 6:15 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> These patches fix the issues reported against the intel_pstate driver.
>
> The first bug reported by Josh Boyer was that the dirver would blow up

s/dirver/driver :)

> when loading in a VM exposed the second bug that the error path in
> intel_pstate_init() was incorrect and biting Konrad Wilk as well.
>
> https://bugzilla.redhat.com/show_bug.cgi?id=916833
> https://lkml.org/lkml/2013/3/5/394

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
