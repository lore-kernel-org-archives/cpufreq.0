From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 56071] New: Ondemand doesn't set correct low frequency
Date: Tue, 2 Apr 2013 10:53:04 +0530
Message-ID: <CAOh2x=ku2=wfW7McmuX3UO7b+vioVf-9-4px30YOgiTTwZ0Xmg@mail.gmail.com>
References: <bug-56071-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Xkc0TVh8HeYaY06VM1P5bCsjymM2JgO3EnAO3C2eaZY=;
        b=Hz+0PgJl4Y8K72H6ezAdJczg/QhOCHgzEkEZi2IUIF551he7EwYLr4X0RSqSDKpYq/
         RoE0vDEuql5HmDEkhL55r8XqF1v6xWxtJib9rFq78Id0qFxVWrYxwVCwWZorkJfgMQnM
         qbz75eXTdd+Tg+DExB+MJal4h+NHSGwQ4FX5+thIGKGcyghjwhh5EjmzzVg2i6a3n9Lz
         7qhxn6QNtSeI++S4Vy3CFk7HS9a7uIKzUtGmwQHh8MDxf1Y6fOKFHymSY7Yef5kFKcFe
         fEiDvgtCenWggVpI6jHEEqdhfRj0Af+WFQlkPaowopFDIV/NaNeiy4aJouL8aO4/OJ76
         HWGw==
In-Reply-To: <bug-56071-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bugzilla-daemon@bugzilla.kernel.org
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, trenn@suse.de, Borislav Petkov <bp@alien8.de>

On Tue, Apr 2, 2013 at 1:42 AM,  <bugzilla-daemon@bugzilla.kernel.org> wrote:
> I've a samsung NP535U3C, powered by AMD A6-4455M APU. Cpupower tells to me that
> the lower frequency reachable by my CPU is 900 MHz but ondemand governor switch
> only between 1.3 and 2.1 GHz and not between 900 MHz and 2.1GHz as it should
> be. I've also tried to set userspace governor to work between those frequencies
> but didn't work. Attached there is my cpupower frequency-info output. Thank
> you.

Your command gives you:

limiti hardware: 1.30 GHz - 2.10 GHz

I can make out from the above that your cpufreq driver gave min freq possible as
1.3 GHz.

Borislav/Thomas,

You have any idea about why this can happen?

Francescodario, BTW you have any idea  from what kernel version this happened?
