From: Dominik Brodowski <linux@brodo.de>
Subject: Re: newbie: Patch Confusion, P4 not supported?
Date: Wed, 18 Jun 2003 16:13:41 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030618141341.GA1442@brodo.de>
References: <200306181245.07941.simon@highlyillogical.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200306181245.07941.simon@highlyillogical.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon <simon@highlyillogical.org>
Cc: cpufreq@lists.arm.linux.org.uk

Hi Simon,

> I couldn't make any of the patches on www.brodo.de/cpufreq_old apply to my 
> kernel cleanly. They look rather old, and the page is no longer in use.
Indeed. That's why it's named cpufreq_old :-) 

Fortunately, though, Dave Jones took over as maintainer. You can find an
upgraded backport of cpufreq for 2.4.21-rc8 (which is [almost] the same as
2.4.21]) at
http://www.codemonkey.org.uk/cpufreq/

	Dominik
