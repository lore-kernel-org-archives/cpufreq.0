From: Dave Jones <davej@redhat.com>
Subject: Re: [BUG] Interesting race between cpufreq_ondemand and snd_atiixp
Date: Fri, 15 Jun 2007 20:54:28 -0400
Message-ID: <20070616005428.GG23417@redhat.com>
References: <200706160233.47659.caglar@pardus.org.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200706160233.47659.caglar@pardus.org.tr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?Uy7Dh2HEn2xhcg==?= Onur <caglar@pardus.org.tr>
Cc: tiwai@suse.de, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Sat, Jun 16, 2007 at 02:33:41AM +0300, S.Çağlar Onur wrote:

 > One of our colleagues found following problem with his old laptop while 
 > testing Linus's latest git with external alsa-driver (v1.0.14). And we can 
 > also reproduce same problem with 2.6.18.8 so it seems not a new regression 
 > (if it is a regression).
 > 
 > As a summary "sound stops to work if cpufreq_ondemand governor is used" on 
 > that laptop. Problem occurs only if cpufreq_* modules are loaded and %100 
 > reproducable if system configured for ondemand governor. 

I'm puzzled.  The cpuinfo shows that this cpu doesn't have speedstep, so
why acpi-cpufreq successfully loads is a mystery.

What's in/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies  ?

Maybe the acpi implementation is faking multiple speeds using throttling
a la p4-clockmod, which would be a bit loopy, but possible I guess.

	Dave

-- 
http://www.codemonkey.org.uk
