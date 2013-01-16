From: Borislav Petkov <bp@alien8.de>
Subject: Re: [arch-general] powernow-k8 fails to load with linux 3.7.2
Date: Thu, 17 Jan 2013 00:17:28 +0100
Message-ID: <20130116231728.GA10204@x1.alien8.de>
References: <20130115224755.085aa6b7@bluemoon>
 <20130116131725.4e590c34@bluemoon>
 <CAG-2HqWBVf=RWXExeFgxYdPTzPfQYZnt-3ZKzULTwdP9+-5mVQ@mail.gmail.com>
 <1448223.sdUJnNSRz4@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358378249; bh=1fboLCilR5Qdxqhapvd39w6yiAwuvwofMsTnswySlPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=ozsw+Ot8RvYKUun7UrJb/gVhagm4e0FS5QMLZf
	h6NPxMo8WMd5Fvfn8Of6R1rWwXmnF+Fbh4thmWz5k6nCla2oCPs3keVTvKuK8SalHg+
	Q8Wr3vU4lxwYBN6xRyha4/gaVwjiraAS9CzL5ZxReI8RvoxyP+HzhMBGH3pdoZn1sw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358378249; bh=1fboLCilR5Qdxqhapvd39w6yiAwuvwofMsTnswySlPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=ozsw+Ot8RvYKUun7UrJb/gVhagm4e0FS5QMLZf
	h6NPxMo8WMd5Fvfn8Of6R1rWwXmnF+Fbh4thmWz5k6nCla2oCPs3keVTvKuK8SalHg+
	Q8Wr3vU4lxwYBN6xRyha4/gaVwjiraAS9CzL5ZxReI8RvoxyP+HzhMBGH3pdoZn1sw=
Content-Disposition: inline
In-Reply-To: <1448223.sdUJnNSRz4@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Tom Gundersen <teg@jklm.no>, =?utf-8?B?QW5kcsOp?= Przywara <andre@andrep.de>, Matthew Garrett <mjg@redhat.com>, Leonid Isaev <lisaev@umail.iu.edu>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org

[ fixup Andre's address. ]

On Wed, Jan 16, 2013 at 11:33:21PM +0100, Rafael J. Wysocki wrote:
> > down the frequancy, but is accompanied by an info-level kernel message
> > "acpi-cpufreq: overriding BIOS provided _PSD data".

That just says that BIOS has crappy data and we're using our own.

> Well, I was afraid that something like this would happen after the
> recent AMD cpufreq changes.
>
> Andre, do we have a clear way to address these problems?

I'm working on a patch (see thread at
http://marc.info/?l=linux-pm&m=135791578516584&w=2) that should take
care of really fixing handoff to acpi_cpufreq from powernow-k8, need to
sort out some stuff first though.

Btw, the handoff from powernow-k8 to acpi_cpufreq works on my systems,
but I haven't tested 3.7.2 so maybe we're missing some patches there.
Leonid, can you send your config pls?

Thanks.

-- 
Regards/Gruss,
Boris.
