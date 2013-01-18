From: Borislav Petkov <bp@alien8.de>
Subject: Re: [arch-general] powernow-k8 fails to load with linux 3.7.2
Date: Fri, 18 Jan 2013 18:10:51 +0100
Message-ID: <20130118171051.GC4062@pd.tnic>
References: <1448223.sdUJnNSRz4@vostro.rjw.lan>
 <20130116231728.GA10204@x1.alien8.de>
 <20130116181600.4c48ee3b@bluemoon>
 <20130117094648.GD30700@pd.tnic>
 <20130117194044.7a18a29d@bluemoon>
 <20130118113717.GA6808@pd.tnic>
 <20130118133233.4521ddb6@hydra>
 <E99CBA9F97C3D149AA6B19ED2E277C9B0193997E@BY2PRD0510MB365.namprd05.prod.outlook.com>
 <20130118152633.GA4062@pd.tnic>
 <E99CBA9F97C3D149AA6B19ED2E277C9B019399B6@BY2PRD0510MB365.namprd05.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358529056; bh=q848bq++lmEQD9xu6q+yjgSycAgC1dwwCF+ssYgBuRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=B73fPbQe/2gztWQS4tVZTGu5lrnf/N0vssft1x
	aEikTGk7gIsO6Y8kQVoAdubCubcbHGrkkcnEFv7YPHGuMCnVd+FGL7hTZ5BvOcGPTGT
	knB49IFpsYjs29ZnfgjkHHZDS+xmWkKroFsrcB9/bPLHP1V4k0jTy+hNk99/kjuR34=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358529056; bh=q848bq++lmEQD9xu6q+yjgSycAgC1dwwCF+ssYgBuRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=B73fPbQe/2gztWQS4tVZTGu5lrnf/N0vssft1x
	aEikTGk7gIsO6Y8kQVoAdubCubcbHGrkkcnEFv7YPHGuMCnVd+FGL7hTZ5BvOcGPTGT
	knB49IFpsYjs29ZnfgjkHHZDS+xmWkKroFsrcB9/bPLHP1V4k0jTy+hNk99/kjuR34=
Content-Disposition: inline
In-Reply-To: <E99CBA9F97C3D149AA6B19ED2E277C9B019399B6@BY2PRD0510MB365.namprd05.prod.outlook.com>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: =?utf-8?B?QW5kcsOp?= Przywara <andre@andrep.de>, Leonid Isaev <lisaev@umail.iu.edu>, "Rafael J. Wysocki" <rjw@sisk.pl>, Tom Gundersen <teg@jklm.no>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>

On Fri, Jan 18, 2013 at 03:32:45PM +0000, Matthew Garrett wrote:
> On Fri, 2013-01-18 at 16:26 +0100, Borislav Petkov wrote:
> > Yep, that should be one way to fix it.
> > 
> > One other fix IMHO would be if udev is looking at CPUID bits, to teach
> > it to check the proper P-States feature bits on Intel and AMD:
> 
> I think it makes more sense to use the existing CPU modaliases than to
> special-case it in udev.

Well, actually, those CPUID bits are there for exactly that reason: to
query them and enable software features. And this is one of the reasons
CPUID is a ring 3 instruction: so that even userspace can use it.

So, in a perfect world, udev should simply run CPUID, check the
respective bits, and, if they're set, load the respective driver. That
is, if it doesn't do it already.

No need for additional code glue in the kernel or anywhere else.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
