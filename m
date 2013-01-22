From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] Add module aliases for acpi-cpufreq
Date: Tue, 22 Jan 2013 23:05:01 +0100
Message-ID: <20130122220501.GA18942@pd.tnic>
References: <1358872944-7676-1-git-send-email-matthew.garrett@nebula.com>
 <20130122173835.GB6431@pd.tnic>
 <3231405.HBLxbMEfo4@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358892126; bh=whAe0ObaVrEtamFs3AiHLwZ3sat7z4XkWVO6Sg/yN1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=YlAsnd4QN9XA2xHM0SVWX8EWV9E38TZBvLamR6
	vdkAGY8zEuTYUpqhCkdRNltDv+Mk/EXWch7lX99oFzaDj8qG85xxLkcFVi0dKTDF4Hp
	pDnR3E9bx77BeSNBxBII83OnS8s3oMijt4Wz+3QizisHN8YQRS+et/WJGJQiEpWaZc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358892126; bh=whAe0ObaVrEtamFs3AiHLwZ3sat7z4XkWVO6Sg/yN1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=YlAsnd4QN9XA2xHM0SVWX8EWV9E38TZBvLamR6
	vdkAGY8zEuTYUpqhCkdRNltDv+Mk/EXWch7lX99oFzaDj8qG85xxLkcFVi0dKTDF4Hp
	pDnR3E9bx77BeSNBxBII83OnS8s3oMijt4Wz+3QizisHN8YQRS+et/WJGJQiEpWaZc=
Content-Disposition: inline
In-Reply-To: <3231405.HBLxbMEfo4@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Leonid Isaev <lisaev@umail.iu.edu>

On Tue, Jan 22, 2013 at 10:57:05PM +0100, Rafael J. Wysocki wrote:
> Do I think correctly that it should go into 3.7.y too?

Looks like I missed the most important tag. Good thinking, yes, tag it
for 3.7-stable too pls.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
