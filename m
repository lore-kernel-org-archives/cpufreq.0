From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 3.6-rc6] cpufreq/powernow-k8: workqueue user shouldn't
 migrate the kworker to another CPU
Date: Tue, 18 Sep 2012 13:27:50 -0700
Message-ID: <CA+55aFwt9Wd9cwk3B4U0+B+EyBJm8oG0r0ADQvEa0D4HmrMWQQ@mail.gmail.com>
References: <20120917201721.GJ18677@google.com> <20120918201231.GF8474@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=BrX5uZZx24sSu+HNQ9OWPTuj3zI5hb7Q2LG2j+EJLjE=;
        b=ODYwSN5oC5Q6JttEOejNME3jMfPchS9opZf/EHOuJA/G4EtWwdpNFQ+hMZXwrWf87D
         o+in2kuGEqtWfVLvP8NdtnpW43NM5wt0AMTTzvJs2ml19LpwK0e0oy9c1XnUC40XVUhB
         LMalb3aooAGMrqFA86SBVY3a8RKWVTQMyQjvX9awZJ2zdz6Md+xkBkyJgHKvbcG3RajN
         WKSeO5NUxsOOo/CJGvDKr8fRCzF+GZ5ufXdSNXHov2uyft9ESMvnORpt72Uky/Sh4pAE
         v5NuZj2HRoGsFfsdUiuP3F5iBgS5y8ZP5vGp5GVB9huvztkrWnOtX+GbcCw/deeDumCH
         MqLQ==
In-Reply-To: <20120918201231.GF8474@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Duncan <1i5t5.duncan@cox.net>, Andreas Herrmann <andreas.herrmann3@amd.com>

On Tue, Sep 18, 2012 at 1:12 PM, Tejun Heo <tj@kernel.org> wrote:
> So, with work_on_cpu() reimplementation just posted[1], we can do the
> following instead.  Functionally it's about the same but less ugly.
> Ugly as it may be, I think the previous open coded version is better
> suited as a fix and for -stable.  Thoughts?

I have to say, since the work_on_cpu() reimplementation seems to
seriously simplify the code, and removes more lines than it adds, and
makes this patch smaller than your original patch, I would personally
prefer this approach instead anyway.

It's what we want long-range, isn't it? And it's smaller and simpler.
Sure, it might be a *conceptually* bigger change, but since it's both
prettier and *practically* smaller, I do like it more. Even at this
stage of -rc (and even for backporting to -stable).

Can we get some quick testing of this two-patch series from the people
who saw the original K8 cpufreq issue? Duncan?

           Linus
