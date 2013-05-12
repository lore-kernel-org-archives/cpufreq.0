From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 58001] New: "ondemand" CPU governor never raises frequency
 (Dell XPS 12)
Date: Sun, 12 May 2013 21:02:22 +0530
Message-ID: <CAOh2x==cwS-DEvH2sSaz=gwpxcv4jS4m_GdEuLLUCDV-5sfh0g@mail.gmail.com>
References: <bug-58001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=LYbGcfV4fJa0kmqh3SQ4QJgEw3ydko+7L4ezjU9PO/0=;
        b=YKFESfhJArdPa2DZglhNSnQcs8pWtOYDa1F/tpWSZFNxof0X6nrUemdQ3B9K2s+Qit
         3Y0iTb/x4i9gO3OqDokl+BC6uz5Wer6bG+f0Qt/OFjomy67QmC3wBtIFoi4ztpelYpQ0
         f7CCbXpt9owXsbK7H5f2rqG/sqsWcGVz6+oo41UjJuAEmsgX+HryjD0+ME87zkhKNHqm
         8Ozx04/W58RCshNMkT5nu/KDMJfN1zE661MKzmntjN/sEdf0NoHuxkuSpQuBNPNb7D75
         F6MkRwWq0vcraatxyszSq3Ig1v3wuT3tZK6mTwQ0339X+eX9RKLVvypcgEKJ8TRIVp/W
         /fVg==
In-Reply-To: <bug-58001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bugzilla-daemon@bugzilla.kernel.org
Cc: cpufreq@vger.kernel.org

On Sat, May 11, 2013 at 3:02 PM,  <bugzilla-daemon@bugzilla.kernel.org> wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=58001
>
>            Summary: "ondemand" CPU governor never raises frequency (Dell
>                     XPS 12)
>            Product: Power Management
>            Version: 2.5
>     Kernel Version: 3.8.11-200.fc18.x86_64
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: cpufreq
>         AssignedTo: cpufreq@vger.kernel.org
>         ReportedBy: jylefort@gmail.com
>         Regression: No
>
>
> On a Dell XPS 12 (Intel Core i7-3537U), I experience exactly the same symptoms
> as in bug #14771, except it has nothing to do with the power supply: I'm using
> the stock power supply, and the problematic behavior is observed both on
> battery and on AC power.
>
> If I keep the default settings, the CPU frequency never goes beyond the 800 MHz
> minimum, regardless of the CPU load.
>
> If I decrease /sys/devices/system/cpu/cpufreq/ondemand/up_threshold from the
> default value of 95 to 75, then the processors dynamically switch back and
> forth from 800 MHz to 2 GHz according to CPU load.

It sort of means system isn't loaded well :)

Can you paste/attach output of cpufreq-info?
