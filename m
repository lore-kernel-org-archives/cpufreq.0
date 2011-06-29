From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 2/2] Add cpufreq driver for Momentum Maple boards
Date: Thu, 30 Jun 2011 00:58:44 +0400
Message-ID: <BANLkTimjBfMBXEdH7k-6sTjb1P+Fq3-Fvg@mail.gmail.com>
References: <1308316207-9075-1-git-send-email-dbaryshkov@gmail.com>
	<1308316207-9075-2-git-send-email-dbaryshkov@gmail.com>
	<1309318110.32158.520.camel@pasglop>
	<BANLkTikD_x3QA8_q8+444QhA39SEW6hVfg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ea8bTqefs1EFTt3MmSNQf+9jzbOPYHeTRh1PP2k1ZTI=;
        b=tt23WgcZgl58vwAsunJiJO7MNFCBDMiIhqavOtjpbp+7mW8Hm+DpsuVu2SMfgwsSEx
         /5eZBb2fZLweo+IQUr09WSpQaaA09NxLGV1UOmpzCl+BKZyBOhlgh5FvbBTo11yKGtjL
         T3lJNuDH7sqeZLT8W+5Vu8rCy/vfXjtVmBjc4=
In-Reply-To: <BANLkTikD_x3QA8_q8+444QhA39SEW6hVfg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kevin diggs <diggskevin38@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Dave Jones <davej@redhat.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, cpufreq@vger.kernel.org

On Wed, Jun 29, 2011 at 10:09 PM, kevin diggs <diggskevin38@gmail.com> wrote:
> Hi,
>
> On Tue, Jun 28, 2011 at 10:28 PM, Benjamin Herrenschmidt >
>>
>> If we're going to have a Kconfig.powerpc, should we maybe just have a
>> powerpc subdirectory instead with the driver in it ?
>>
> Where would the powerpc subdirectory be? under drivers/cpufreq? Or
> somewhere under arch/powerpc where it belongs (and I put my 750GX
> stuff)?

drivers/cpufreq/powerpc. However my current version (as suggested by Ben)
goes directly to drivers/cpufreq

-- 
With best wishes
Dmitry
