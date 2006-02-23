From: Andi Kleen <ak@suse.de>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Fri, 24 Feb 2006 00:55:30 +0100
Message-ID: <200602240055.30603.ak@suse.de>
References: <20060214152218.GI10701@stusta.de> <200602240016.00317.ak@suse.de> <20060223233328.GB3674@stusta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932148AbWBWXx5@vger.kernel.org>
In-Reply-To: <20060223233328.GB3674@stusta.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@stusta.de>
Cc: Dave Jones <davej@redhat.com>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Friday 24 February 2006 00:33, Adrian Bunk wrote:

> EMBEDDED is the wrong option, since the semantics of embedded is "show
> more options to allow additional space savings". It is not and should
> not be abused as an option to hide random options from users.

I disagree. And I originally added most EMBEDDED users to the kernel.
The purpose I added it for was to hide options that only useful
for a very limited userbase but cause big or subtle trouble when set
wrong. P4_CLOCKMOD clearly qualifies.

-Andi
