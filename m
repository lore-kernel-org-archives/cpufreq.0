From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] (3/3) cpufreq_ondemand - 03_sys_freq_step.diff
Date: Mon, 21 Feb 2005 16:17:50 +0100
Message-ID: <20050221151750.GB12182@poupinou.org>
References: <20050220131808.GD4495@inskipp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050220131808.GD4495@inskipp>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Clouter <alex@digriz.org.uk>
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, alex-kernel@digriz.org.uk, linux@dominikbrodowski.de

On Sun, Feb 20, 2005 at 01:18:08PM +0000, Alexander Clouter wrote:
> Adds support so that the cpufreq change stepping is no longer fixed at 5% and 
> can be changed dynamically by the user
> 

The cpufreq core will step to the next available frequency (in both
direction).  So I failed to see the usefullness for this one.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
