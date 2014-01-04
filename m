From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: intel_pstate divide error with v3.13-rc4-256-gb7000ad
Date: Sat, 04 Jan 2014 09:35:58 +0100
Message-ID: <52C7C7EE.1070407@redhat.com>
References: <CA+5PVA6YpKc6kYK5UiTnGLZpB8uts=-QPtyhotAyZ2kuoG8PPQ@mail.gmail.com> <52C6F3B4.3050904@gmail.com> <20140103180435.GK10961@minantech.com> <2513222.AheLcigoE8@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=/zQN3pAd884WeZNtVc+0j//AhQPGEBEeS9c2bvSW134=;
        b=ntznQ59nQH3QT33MxmO09rukWydzZfq2ANKVv/UFpgm/Tl8IQVZ8+YTxyaDwClLvIi
         4CSWXr6SSy6CNPdTS5MeEa2S7GZa1CLtsAhum2nj/nfN9Va2CXC0sFhUgwl9/DRQDSlu
         3OjaNB/g91ZBt0LE8w0OgEY8K4hM9U6Klf58eq+DGE46fz2nMd2M6czF8HYB3K/Th1/v
         kTHcX7UtogD2qqsVCEWTiBt4w6FmBDjjK//DC26DVSWXzonchZGUxqnLO5VsSbyJPACO
         /eBKUTURSZpqF9FZ64TPJZ2KxHEhlwxpHWcHobu244YTgBEvPvIs5gZLSX/R59qPwtm0
         Q0NQ==
In-Reply-To: <2513222.AheLcigoE8@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Gleb Natapov <gleb@kernel.org>, Dirk Brandewie <dirk.brandewie@gmail.com>, Kashyap Chamarthy <kchamart@redhat.com>, Josh Boyer <jwboyer@fedoraproject.org>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "Richard W.M. Jones" <rjones@redhat.com>

Il 03/01/2014 23:46, Rafael J. Wysocki ha scritto:
> Well, fixing the KVM bug is surely welcome.
> 
> That said, adding checks to ensure that your assumptions are valid is rarely
> wrong, especially if they are done once per kernel boot.  And the kernel only
> should panic if it cannot continue to run, which isn't the case here.

I agree, but I suspect even your check is already late.  Your patch is
welcome but perhaps it should have a WARN_ON too.

Paolo
