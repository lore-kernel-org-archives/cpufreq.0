From: Wes Felter <wesley@felter.org>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Mon, 27 Feb 2006 15:17:37 -0600
Message-ID: <dtvqaa$1et$1@sea.gmane.org>
References: <20060214152218.GI10701@stusta.de> <20060222024438.GI20204@MAIL.13thfloor.at> <20060222031001.GC4661@stusta.de> <200602212220.05642.dtor_core@ameritech.net> <20060223195937.GA5087@stusta.de> <20060223204110.GE6213@redhat.com> <20060225015722.GC8132@linuxtv.org> <20060225042456.GA7851@redhat.com> <20060225125337.GB8698@linuxtv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751756AbWB0VTW@vger.kernel.org>
In-Reply-To: <20060225125337.GB8698@linuxtv.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org
Cc: cpufreq@lists.linux.org.uk

Johannes Stezenbach wrote:

> If someone has done measurements I'd be interested to
> know the numbers about the actual power savings which
> can be achieved by using P4 clock mod. I don't expect
> it to be much, but I bet it's more than 1W.

Clock modulation can reduce power by 40W on a 3.6GHz Xeon when the 
system is running a high-power application (e.g. Linpack). (It also 
reduces performance by a factor of 6-10). Clock modulation saves no 
power at all during idle.

Wes Felter - wesley@felter.org
