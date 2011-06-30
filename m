From: kevin diggs <diggskevin38@gmail.com>
Subject: Re: [PATCH 2/2] Add cpufreq driver for Momentum Maple boards
Date: Thu, 30 Jun 2011 13:23:03 -0500
Message-ID: <BANLkTinciPSnJHHsMo8nfvsYS1AeDov5Tw@mail.gmail.com>
References: <1308316207-9075-1-git-send-email-dbaryshkov@gmail.com>
	<1308316207-9075-2-git-send-email-dbaryshkov@gmail.com>
	<1309318110.32158.520.camel@pasglop>
	<BANLkTikD_x3QA8_q8+444QhA39SEW6hVfg@mail.gmail.com>
	<BANLkTimjBfMBXEdH7k-6sTjb1P+Fq3-Fvg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=rYXgEL18HQpQv+2GfctU4SUiIQd82SwIXCnH8vmJWoQ=;
        b=Kbnl+WedUmVb/2E13Zj7r0ffGRUvi0v/Ccm5Lfp9dULo6zTxHFBcD9nBcWMP11n2K9
         qBfhCkQ0jAXEItKJ9SEto3F9TDetXgYZ6f2NuVnelSIUoFRoJfjJfHKkEKPSFGhlIrPq
         Ugf9kqNdaHzCW6GrmF+RtLDakr+YdNPh2034E=
In-Reply-To: <BANLkTimjBfMBXEdH7k-6sTjb1P+Fq3-Fvg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Dave Jones <davej@redhat.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, cpufreq@vger.kernel.org

Hi,

On Wed, Jun 29, 2011 at 3:58 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
>
> drivers/cpufreq/powerpc. However my current version (as suggested by Ben)
> goes directly to drivers/cpufreq
>
Uh ... Just curious ... why is arch specific code now being put
outside of the arch directories? When I wrote the 750GX stuff
(~2.6.28) I put in a location similar to what x86 was doing? When did
this change?

kevin
