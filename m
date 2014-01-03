From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: intel_pstate divide error with v3.13-rc4-256-gb7000ad
Date: Fri, 03 Jan 2014 23:06:21 +0100
Message-ID: <52C7345D.30603@redhat.com>
References: <CA+5PVA6YpKc6kYK5UiTnGLZpB8uts=-QPtyhotAyZ2kuoG8PPQ@mail.gmail.com> <4794554.Hmd2RUNYDT@vostro.rjw.lan> <52C18A23.10703@redhat.com> <3710588.K8glfx1cYs@vostro.rjw.lan> <52C6F3B4.3050904@gmail.com> <20140103180435.GK10961@minantech.com> <52C716C1.6070704@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=K1uCWqaKvIp/7f2+LYszqhAwQwi4KHsG1ZXpuafUhOA=;
        b=xz/Ww+N/Tewil9C8UFL1G+OJzCb3NlBljVyr4qAlX86hhlPo0vQs5N0v5Ygfhht+oT
         Vxlh0tL851G7v6Bt/opZmFybmzx//9jsr7R6m0t+PSCApzQk9mgempEYhyejQbir8OP8
         E7TdqJIxgZjyTucX2iCLkb3gPpZ9Ms2RTMezFuIJUAVr4Mkebyxo08SnI9pjH70uyPP2
         HWVNiopw/L1wrPiMuSgsojSh5eD6I0j7sPkdwZv1PoZbyxxd3L4pUh48zfolNpeSh/VJ
         FDf3Z1l9/U0r0j7pXbB//f3wexDrJOcTECJ99oLa27bS7c/gVRhtV7BF8O2evyuOOlwG
         ro+g==
In-Reply-To: <52C716C1.6070704@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Gleb Natapov <gleb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kashyap Chamarthy <kchamart@redhat.com>, Josh Boyer <jwboyer@fedoraproject.org>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "Richard W.M. Jones" <rjones@redhat.com>

Il 03/01/2014 21:00, Dirk Brandewie ha scritto:
> +    case MSR_IA32_MPERF:
> +    case MSR_IA32_APERF:

These should never be accessed.  A KVM VM will always have
CPUID[06H].ECX = 0, and the Intel manual says that the MSRs are only
present if CPUID returns that value with bit 0 set.

I think the actual bug is that intel_pstate_init does not check the
feature bits in CPUID (either manually or via x86_match_cpu).

Paolo
