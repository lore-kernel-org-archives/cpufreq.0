From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [BUG] cpufreq: sleeping function called from invalid context at kernel/workqueue.c:2811
Date: Thu, 7 Feb 2013 16:00:17 +0530
Message-ID: <CAOh2x=kVQ0JOgY7-1UTiz4nwSHkngQ74A0pF8TPDgqaciZnR5g@mail.gmail.com>
References: <20130206202513.GA5626@thinkpad.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=BmIacpDkm2i1GWho2AFU/kEK3WF1W3FAWj8l6orlCq8=;
        b=fejZk799sH2Dz2t8VO5zXcduWxzTh1NHozZ/VBcXGEtNfH4B8SV/WqkyJ4iew114Ap
         dzwPKtLNCQURiGj9VBhhrU7o2jIMq6bMWhAtap0K3vFUrB2UMLXYLFNM3+zrguQdzkKw
         xxunQp6pUF8yesYXy8iiag1qdrfCyslsD9b7jew0A7pk+riT5fEsT0MZBmdjrCihvfH1
         84o/NJ+4mCMZJh8KkrdIhVDKdWexviibDM05fidy88OqS76MZpWXhbuW8YGytAOpmRUl
         MB6D7nZONJDw7Le06RdUHBK8O/JIpnuVDH2FF7a1+ELxv0iGfJotqS+nmAUOAqjMTAzX
         iJxg==
In-Reply-To: <20130206202513.GA5626@thinkpad.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Savkov <artem.savkov@gmail.com>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On Thu, Feb 7, 2013 at 1:55 AM, Artem Savkov <artem.savkov@gmail.com> wrote:
> I get the following BUG on suspend using systemd-sleep(this doesn't
> happen with pm-suspend). This seems to be introduced by some of the
> Viresh's patches.

Hi Artem,

I have sent another patchset (and you are in --to), please test your platform
with these and tell us the results.
