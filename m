From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [Bugme-new] [Bug 8924] New: module speedstep-centrino does not
 load
Date: Wed, 22 Aug 2007 16:55:19 -0700
Message-ID: <20070822165519.10ec5d68@laptopd505.fenrus.org>
References: <bug-8924-10286@http.bugzilla.kernel.org/>
	<20070822164451.1481d745.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934215AbXHWABU@vger.kernel.org>
In-Reply-To: <20070822164451.1481d745.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, bugme-daemon@bugzilla.kernel.org, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk, frank@harenberg.ch

On Wed, 22 Aug 2007 16:44:51 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:
> > Problem Description: modprobe speedstep-centrino quits with error
> > "no such device"


does the acpi-cpufreq driver work? on such new hardware that really
should be used rather than the legacy-hw speedstep-centrino
