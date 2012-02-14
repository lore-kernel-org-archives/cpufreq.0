From: J Webster <jw.jwebster@gmail.com>
Subject: Re: speed throttle to 800 cpufreq Ocelot
Date: Tue, 14 Feb 2012 09:10:34 +0000
Message-ID: <4F3A250A.5030107@gmail.com>
References: <CAPKGfw_Ab9p4Kh+EbPRCw+7xC5e=iZj7g3DH+_dvJHvVnxGPmw@mail.gmail.com> <20120213193425.GA2455@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=EWvWy2gksNfi1pwu5+mOaDnq+ulnN7O8vQc8OrqOea0=;
        b=af+iAGcsJ8Q+1wxLLiKJLdkMXF/1xUjOxI7NV7+AtSSkE1cZaZ53p1Zzt/3vy64Lrs
         ztOy1XsjnTxLuWBDJjgZXEVnHR73lJnlQz4OU44gB3gFTXqrz9ctAU9JuQE+Kc3Nv0oA
         htldkK8WYjgfB7+xrMMwkLt5HiNytRQyr13PI=
In-Reply-To: <20120213193425.GA2455@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>

 >   driver: p4-clockmod don't use this driver. it's nothing but 
disappointment and doesn't save you power. I see the inspiron 9300 has a 
pentium M. Some of these lacked EST iirc, so you're probably completely 
out of luck, and can't scale clock speed.

How can I change the driver? This is what Ocelot installed by itself.
It seems strange that the Pentium would be left out.
Isn't there a workaround to get the speed up to max?
Even the indicator-cpufreq does not work.
