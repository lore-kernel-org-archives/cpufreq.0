From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] drivers/cpufreq: delete non-required instances of include <linux/init.h>
Date: Thu, 9 Jan 2014 20:47:54 +0530
Message-ID: <CAOh2x=mfQ1qoWBW3=kwML0aLYu60v107svb4knYwTwsSXTzEaQ@mail.gmail.com>
References: <1389280207-11846-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=gVFFmub0ig8jCBYatc9fjqPj1AfgqAK794efcoPx4hM=;
        b=v3nGUKJ8zmLf1JGjDRrKBv0sAXCRJ60Z1fnI6ssBrC6/hAQyNIBNJKsw6gdZMDhgaC
         U2ugLxLL0g/jdzt4nXenq5arJ63PJSb/mrOyGOV40fvN1uGvOO4aOYeqXIHaKnwOs8m8
         b5YIy3xCC1lFqr5zsSz4PmmON4S5CUbkbSU3OrhKByZ24nrVXil2knXbc4CPH+lVPBqQ
         tQh0SR3RAUeX6uRVXdB7LoTkq1lq4UX9epGy49g2EPsRNbRBSLhF9kF7opw22GnRBPR+
         +W91k198N8JvwouVxIfTIQYr+iGMBKp2jwV7R13WUipBYveZGY1/MzZSPku7X+Gam8/Q
         IGFw==
In-Reply-To: <1389280207-11846-1-git-send-email-paul.gortmaker@windriver.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

On Thu, Jan 9, 2014 at 8:40 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> None of these files are actually using any __init type directives
> and hence don't need to include <linux/init.h>.  Most are just a
> left over from __devinit and __cpuinit removal, or simply due to
> code getting copied from one driver to the next.

Are you sure? Its not only about devinit or cpuinit but module_init()
and others as well. And they are pretty much used by most of them.
