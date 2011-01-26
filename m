From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHSET] workqueue: update workqueue users - replace
 create_workqueue()
Date: Wed, 26 Jan 2011 11:40:08 +0100
Message-ID: <20110126104008.GG12520@htj.dyndns.org>
References: <1294062595-30097-1-git-send-email-tj@kernel.org>
 <20110125142921.GB27510@htj.dyndns.org>
 <20110125162654.GA4795@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:date:from:to:subject:message-id
         :references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=7RVVxMp/WKTUlPK0DibGKVGUHvzAb9yM/tDJphGBPKE=;
        b=GiSYFF8BkDXsA8YHtvpreASjxgzliq6pLRMIgnNK/JrcRABUc1zkjVtOQF0HmriGc6
         zfuNnVlh5/NC04rLLYiOqEumoYurhEk6buowCSgrPUjvaeIHXEeX77j2n5JfegrmL0z+
         67cgqg/WAvCsIKV5pBtEccVq0THmhKOLIOOH0=
Content-Disposition: inline
In-Reply-To: <20110125162654.GA4795@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, cpufreq@vger.kernel.org

On Tue, Jan 25, 2011 at 11:26:54AM -0500, Dave Jones wrote:
> On Tue, Jan 25, 2011 at 03:29:21PM +0100, Tejun Heo wrote:
>  > Hello,
>  > 
>  > There was no response for the following patches and I'm planning on
>  > routing them through workqueue#for-2.6.39.  If you have an objection
>  > or want to take the patch through a different tree, please let me
>  > know.
>  > ..
>  >  0007-cpufreq-use-system_wq-instead-of-dedicated-workqueue.patch
> 
> Feel free to add my 
> Signed-off-by: Dave Jones <davej@redhat.com> 
> to this.
> 
> I looked it over, and didn't see anything objectionable.

As the patch is going through wq tree, I added Acked-by instead of
Signed-off-by.

Thank you.

-- 
tejun
