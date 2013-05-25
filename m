From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [Bug 58801] New: intel_pstate/powersave - cpu frequency remains at high level if if system is idle
Date: Sat, 25 May 2013 11:16:07 +0200
Message-ID: <456505694.pBGKBVuPaA@vostro.rjw.lan>
References: <bug-58801-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58801-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bugzilla-daemon@bugzilla.kernel.org
Cc: cpufreq@vger.kernel.org

On Saturday, May 25, 2013 07:24:54 AM bugzilla-daemon@bugzilla.kernel.org wrote:
[...]
> 
> With the kernel versions 3.9.3 and now even 3.9.4 the frequency remains at a
> quite high frequency (3.0 or 2.9 GHz) even if the the system is completely
> idle.
> 
> As I have not changed the kernel-config when I updated to the versions 3.9.3
> and 3.9.4 I assume some bug was introduced in the kernel as of 3.9.3.
> 
> Please let me know if you need any further info.

Can you possibly identify the change between 3.9.1 and 3.9.3 that introduced
the problem for you?

